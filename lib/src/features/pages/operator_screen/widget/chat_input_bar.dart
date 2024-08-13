import 'package:flutter/material.dart';
import 'package:qbox_mobile/src/core/styles/app_colors.dart';
import 'package:qbox_mobile/src/features/providers/chat_provider.dart';

import 'custom_bottom_sheet.dart';
import 'custom_icon_button.dart';

class ChatInputBar extends StatelessWidget {
  const ChatInputBar({
    required this.provider,
    super.key,
  });

  final ChatProvider provider;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Row(
        children: [
          const SizedBox(width: 10),
          CustomIconButton(
            onPressed: () => showModalBottomSheet(
              context: context,
              builder: (context) => const CustomBottomSheet(),
            ),
            icon: Icons.menu,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.lightDark90.withOpacity(0.5),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: TextField(
                cursorColor: AppColors.blue,
                maxLines: 4,
                minLines: 1,
                controller: provider.controller,
                onChanged: (value) => provider.message = value,
                // onSubmitted: provider.sendMessage,
                decoration: const InputDecoration(
                  prefix: SizedBox(width: 8),
                  hintText: ' Type a message',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          CustomIconButton(
            onPressed: () {
              provider.sendFile();
            },
            icon: Icons.attach_file_sharp,
          ),
          const SizedBox(width: 10),
          CustomIconButton(
            onPressed: () {
              provider.sendMessage();
            },
            icon: Icons.send,
          ),
        ],
      ),
    );
  }
}
