import 'package:flutter/material.dart';
import 'package:voice_message_package/voice_message_package.dart';

class CustomAudioPlayer extends StatelessWidget {
  const CustomAudioPlayer({
    required this.url,
    super.key,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return VoiceMessageView(
      controller: VoiceController(
        audioSrc: url,
        onComplete: () {},
        onPause: () {},
        onPlaying: () {},
        onError: (err) {},
        maxDuration: const Duration(seconds: 10),
        isFile: false,
      ),
      innerPadding: 12,
      cornerRadius: 20,
    );
  }
}
