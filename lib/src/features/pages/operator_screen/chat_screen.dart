import 'package:qbox_mobile/src/features/providers/chat_provider.dart';
import 'package:qbox_mobile/src/features/services/db_service/db_service.dart';

import 'widget/chat_input_bar.dart';
import 'widget/chat_message_widget.dart';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(
      // ignore: deprecated_member_use
      builder: (context, provider, child) => WillPopScope(
        onWillPop: () {
          provider.setMessageCount();
          Navigator.pop(context);
          return Future.value(false);
        },
        child: Scaffold(
          backgroundColor: const Color(0xFFF4F5F9),
          appBar: AppBar(
            title: const Text('Chat'),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                provider.setMessageCount();
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: provider.scrollController,
                  itemCount: provider.chatMessages.length,
                  itemBuilder: (context, index) {
                    final message = provider.chatMessages[index];
                    final isMyMessage = message.senderToken == DBService.token;
                    return ChatMessageWidget(
                      message: message,
                      isMyMessage: isMyMessage,
                    );
                  },
                ),
              ),
              ChatInputBar(provider: provider),
            ],
          ),
        ),
      ),
    );
  }
}
