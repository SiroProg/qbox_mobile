import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbox_mobile/src/core/styles/app_colors.dart';
import 'package:qbox_mobile/src/features/pages/operator_screen/chat_screen.dart';
import 'package:qbox_mobile/src/features/providers/chat_provider.dart';
import 'package:qbox_mobile/src/features/services/socket_service.dart';
import 'package:badges/badges.dart' as badges;

class CustomBottomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomBottomAppBar({super.key});

  @override
  State<CustomBottomAppBar> createState() => _CustomBottomAppBarState();

  @override
  Size get preferredSize => throw UnimplementedError();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(
      builder: (
        BuildContext context,
        ChatProvider chatProvider,
        Widget? child,
      ) =>
          BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => chatProvider.toggleVideo(),
                icon: Icon(
                  chatProvider.localStream?.getVideoTracks().first.enabled ??
                          false
                      ? CupertinoIcons.video_camera
                      : Icons.videocam_off,
                ),
              ),
              IconButton(
                onPressed: () => chatProvider.toggleAudio(),
                icon: Icon(
                  chatProvider.localStream?.getAudioTracks().first.enabled ??
                          false
                      ? Icons.mic
                      : Icons.mic_off,
                ),
              ),
              IconButton(
                onPressed: () => chatProvider.switchCamera(),
                icon: const Icon(
                  CupertinoIcons.switch_camera,
                ),
              ),
              badges.Badge(
                badgeContent: chatProvider.messageCount == 0
                    ? const SizedBox.shrink()
                    : Text(
                        '${chatProvider.messageCount}',
                        style: const TextStyle(color: AppColors.white),
                      ),
                position: badges.BadgePosition.topEnd(top: -5, end: -8),
                badgeStyle: badges.BadgeStyle(
                  badgeColor: chatProvider.messageCount == 0
                      ? Colors.transparent
                      : AppColors.red,
                ),
                child: IconButton(
                  onPressed: () {
                    chatProvider.setMessageCount();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChatScreen(),
                      ),
                    );
                  },
                  icon: const Icon(CupertinoIcons.chat_bubble),
                ),
              ),
              FloatingActionButton(
                backgroundColor: AppColors.red,
                onPressed: () {
                  socketService.socket.emit('message', {
                    'rtc': {'type': 'hangup'}
                  });
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: const Icon(
                  Icons.call_end,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
