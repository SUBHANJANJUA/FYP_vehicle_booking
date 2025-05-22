import 'package:cloud_firestore/cloud_firestore.dart';

class ChatMessageModel {
  final String senderId;
  final String text;
  final DateTime timestamp;

  ChatMessageModel({
    required this.senderId,
    required this.text,
    required this.timestamp,
  });

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    return ChatMessageModel(
      senderId: json['senderId'],
      text: json['text'],
      timestamp: (json['timestamp'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'senderId': senderId,
      'text': text,
      'timestamp': Timestamp.fromDate(timestamp),
    };
  }
}
