import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:vehicle_booking/app/data/models/chat_meesage_model.dart';

class ChatController extends GetxController {
  static ChatController get to => Get.find<ChatController>();
  late String currentUserId;
  late String otherUserId;
  final isChatViewOpen = false.obs;
  @override
  void onInit() {
    super.onInit();
    isChatViewOpen.value = true;
  }

  @override
  void onClose() {
    isChatViewOpen.value = false;
  }

  final messages = <ChatMessageModel>[].obs;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String get chatId => currentUserId.hashCode <= otherUserId.hashCode
      ? '$currentUserId\_$otherUserId'
      : '$otherUserId\_$currentUserId';

  void initChat({required String current, required String other}) {
    currentUserId = current;
    otherUserId = other;
    _listenToMessages();
  }

  void _listenToMessages() {
    _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .listen((snapshot) {
      messages.value = snapshot.docs
          .map((doc) => ChatMessageModel.fromJson(doc.data()))
          .toList();
    });
  }

  void sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    final msg = ChatMessageModel(
      senderId: currentUserId,
      text: text,
      timestamp: DateTime.now(),
    );

    final chatDocRef = _firestore.collection('chats').doc(chatId);

    // 1. Save the message
    await chatDocRef.collection('messages').add(msg.toJson());

    // 2. Update the main chat document (for preview in chat list)
    await chatDocRef.set({
      'participants': [currentUserId, otherUserId],
      'lastMessage': text,
      'timestamp': Timestamp.now(),
    }, SetOptions(merge: true));
  }
}

class ChatListController extends GetxController {
  final RxList<Map<String, dynamic>> chatList = <Map<String, dynamic>>[].obs;
  final String currentUserId;

  ChatListController({required this.currentUserId});

  @override
  void onInit() {
    super.onInit();
    fetchChats();
  }

  void fetchChats() {
    FirebaseFirestore.instance
        .collection('chats')
        .where('participants', arrayContains: currentUserId)
        .orderBy('timestamp', descending: true)
        .snapshots()
        .listen((querySnapshot) {
      chatList.value = querySnapshot.docs.map((doc) {
        return {
          'chatId': doc.id,
          'lastMessage': doc['lastMessage'] ?? '',
          'timestamp': doc['timestamp'],
          'participants': List<String>.from(doc['participants']),
        };
      }).toList();
    });
  }
}
