import 'package:flutter/material.dart';
import 'package:qbox_mobile/src/core/models/operator_call/operator_models/chat.dart';
import '../../../../core/utils/check_url.dart';

import 'custom_audio_player.dart';
import 'custom_video_player.dart';
import 'open_file_btn.dart';

class ChatMessageWidget extends StatelessWidget {
  final Chat message;
  final bool isMyMessage;

  const ChatMessageWidget({
    required this.message,
    required this.isMyMessage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMyMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: _buildMessageContent(isMyMessage),
          ),
          Text(
            '${message.time.hour}:${message.time.minute}         ',
            style: const TextStyle(fontSize: 8),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageContent(bool isMyMessage) {
    if (isUrlImage(message.message)) {
      return Image.network(
        message.message,
        fit: BoxFit.scaleDown,
        height: 200,
        width: 200,
      );
    } else if (isUrlVideo(message.message)) {
      return CustomVideoPlayer(url: message.message);
    } else if (isUrlFile(message.message)) {
      return OpenFileBtn(
        url: message.message,
        fileName: message.fileName ?? message.message,
        isMyMessage: isMyMessage,
        size: message.size ?? 0,
      );
    } else if (isUrlAudio(message.message)) {
      return CustomAudioPlayer(url: message.message);
    } else {
      return Container(
        decoration: BoxDecoration(
          color: isMyMessage ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            message.message.trim(),
            style: TextStyle(
              color: isMyMessage ? Colors.white : Colors.black,
            ),
          ),
        ),
      );
    }
  }
}
