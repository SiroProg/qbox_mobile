import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  const CustomVideoPlayer({
    required this.url,
    super.key,
  });

  final String url;

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  void _initializeVideo() {
    flickManager = FlickManager(
      // ignore: deprecated_member_use
      videoPlayerController: VideoPlayerController.network(widget.url)
        ..initialize().then((_) {
          setState(() {});
        }),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  void _refreshVideo() {
    setState(() {
      flickManager.dispose();
      _initializeVideo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 150,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FlickVideoPlayer(
          flickManager: flickManager,
          flickVideoWithControls: FlickVideoWithControls(
            controls: const FlickPortraitControls(),
            playerErrorFallback: Center(
              child: IconButton(
                onPressed: _refreshVideo,
                icon: const Icon(
                  Icons.refresh,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
