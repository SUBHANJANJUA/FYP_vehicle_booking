import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_booking/app/data/util/custom_appbar.dart';
import 'package:vehicle_booking/app/modules/chat/controllers/chat_controller.dart';

import 'package:vehicle_booking/app/modules/chat/views/chat_view.dart';
import 'package:vehicle_booking/app/modules/signup/controllers/signup_controller.dart';

class ChatListView extends StatelessWidget {
  ChatListView({super.key});
  final SignupController signupcontroller = Get.put(SignupController());
  @override
  Widget build(BuildContext context) {
    final user = signupcontroller.userModel.value;
    final currentUserId = user!.uid;

    final controller =
        Get.put(ChatListController(currentUserId: currentUserId));

    return Scaffold(
      appBar: CustomAppBar(title: 'All Chats'),
      body: Obx(() {
        if (controller.chatList.isEmpty) {
          return const Center(child: Text("No chats available"));
        }

        return ListView.builder(
          itemCount: controller.chatList.length,
          itemBuilder: (context, index) {
            final chat = controller.chatList[index];
            final customerId = chat['participants']
                .firstWhere((id) => id != currentUserId); // get customer ID

            return ListTile(
              leading: const Icon(Icons.person),
              title: Text('Customer'),
              subtitle: Text(chat['lastMessage']),
              onTap: () {
                Get.to(() => ChatView(
                      currentUserId: currentUserId,
                      otherUserId: customerId,
                      otherUserName:
                          'Customer', // Optional: resolve name from user collection
                    ));
              },
            );
          },
        );
      }),
    );
  }
}
