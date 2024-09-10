import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:qbox_mobile/src/core/styles/app_colors.dart';
import 'package:qbox_mobile/src/features/pages/operator_screen/chat_screen.dart';
import 'package:qbox_mobile/src/features/pages/operator_screen/end_call_screen.dart';
import 'package:qbox_mobile/src/features/pages/operator_screen/menu_bottom_sheet.dart';
import 'package:qbox_mobile/src/features/providers/chat_provider.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

class OperatorCallScreen extends StatefulWidget {
  const OperatorCallScreen({super.key});

  @override
  State<OperatorCallScreen> createState() => _OperatorCallScreenState();
}

class _OperatorCallScreenState extends State<OperatorCallScreen> {
  @override
  void dispose() {
    final chatProvider = Provider.of<ChatProvider>(context, listen: false);

    chatProvider.localRenderer.dispose();
    chatProvider.remoteRenderer.dispose();

    super.dispose();
  }

  void delayFunction() async {
    await Future.delayed(const Duration(seconds: 2), () {
      setState(() {});
    });
  }

  @override
  void initState() {
    delayFunction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(
      builder: (
        BuildContext context,
        ChatProvider chatProvider,
        Widget? child,
      ) =>
          Scaffold(
        appBar: AppBar(
          leading: badges.Badge(
            position: badges.BadgePosition.topEnd(top: 0, end: 0),
            badgeContent: chatProvider.messageCount != 0
                ? const Text(
                    '',
                    style: TextStyle(color: Colors.white),
                  )
                : null,
            badgeStyle: badges.BadgeStyle(
              badgeColor: chatProvider.messageCount != 0
                  ? AppColors.red
                  : Colors.transparent,
            ),
            child: IconButton(
              onPressed: () async {
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
          title: Text(
              "${chatProvider.callUserModel!.firstName} ${chatProvider.callUserModel!.lastName}"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: AppColors.white,
                  builder: (context) => const MenuBottomSheet(),
                );
              },
              icon: const Icon(Icons.more_vert_rounded),
            ),
          ],
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                Positioned.fill(
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: chatProvider.isSwitched
                          ? chatProvider.localRenderer.videoWidth.toDouble()
                          : chatProvider.remoteRenderer.videoWidth.toDouble(),
                      height: chatProvider.isSwitched
                          ? chatProvider.localRenderer.videoHeight.toDouble()
                          : chatProvider.remoteRenderer.videoHeight.toDouble(),
                      child: RTCVideoView(
                        chatProvider.isSwitched
                            ? chatProvider.localRenderer
                            : chatProvider.remoteRenderer,
                        mirror: true,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: chatProvider.widgetPosition.dx,
                  top: chatProvider.widgetPosition.dy,
                  child: Draggable(
                    feedback: buildDraggableChild(chatProvider),
                    childWhenDragging: buildDraggableChild(chatProvider),
                    onDragEnd: (details) {
                      final newPosition = getNewPosition(
                        details.offset,
                        constraints.maxWidth,
                        constraints.maxHeight,
                        120,
                        200,
                      );
                      chatProvider.updateWidgetPosition(newPosition);
                    },
                    child: GestureDetector(
                      onTap: () =>
                          chatProvider.setSwitched(!chatProvider.isSwitched),
                      child: buildDraggableChild(chatProvider),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomIconButton(
                  icon: chatProvider.localStream
                              ?.getVideoTracks()
                              .first
                              .enabled ??
                          false
                      ? CupertinoIcons.videocam
                      : Icons.videocam_off,
                  onTap: () => chatProvider.toggleVideo(),
                ),
                CustomIconButton(
                  icon: chatProvider.localStream
                              ?.getAudioTracks()
                              .first
                              .enabled ??
                          false
                      ? CupertinoIcons.mic
                      : CupertinoIcons.mic_off,
                  onTap: () => chatProvider.toggleAudio(),
                ),
                CustomIconButton(
                  icon: CupertinoIcons.switch_camera,
                  onTap: () => chatProvider.switchCamera(),
                ),
                CustomIconButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const EndCallScreen(),
                      ),
                    );
                  },
                  icon: CupertinoIcons.phone,
                  color: AppColors.red,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDraggableChild(ChatProvider chatProvider) {
    return SizedBox(
      width: 120,
      height: 200,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: chatProvider.isSwitched
              ? Colors.black.withOpacity(0.5)
              : Colors.transparent,
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          child: RTCVideoView(
            chatProvider.isSwitched
                ? chatProvider.remoteRenderer
                : chatProvider.localRenderer,
            mirror: true,
            objectFit: RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
          ),
        ),
      ),
    );
  }

  Offset getNewPosition(
    Offset dragOffset,
    double maxWidth,
    double maxHeight,
    double widgetWidth,
    double widgetHeight,
  ) {
    final double x = dragOffset.dx < maxWidth / 2 ? 0 : maxWidth - widgetWidth;
    final double y =
        dragOffset.dy < maxHeight / 2 ? 0 : maxHeight - widgetHeight;
    return Offset(x, y);
  }
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    required this.onTap,
    required this.icon,
    this.color,
    super.key,
  });

  final VoidCallback onTap;
  final IconData icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      constraints: const BoxConstraints(
        minWidth: 60,
        minHeight: 60,
      ),
      iconSize: 30,
      splashRadius: 50,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          color ?? AppColors.grey.withOpacity(0.4),
        ),
      ),
      onPressed: onTap,
      icon: Icon(icon),
    );
  }
}

// ignore_for_file: deprecated_member_use

// import 'package:flutter/material.dart';
// import 'package:flutter_webrtc/flutter_webrtc.dart';
// import 'package:learn_webrtc/src/core/constants/api_constants.dart';
// import 'package:learn_webrtc/src/core/utils/logger.dart';
// import 'package:learn_webrtc/src/features/operator/chat_screen.dart';

// // ignore: library_prefixes
// import 'package:socket_io_client/socket_io_client.dart' as IO;

// class OperatorCallScreen extends StatefulWidget {
//   const OperatorCallScreen({super.key});

//   @override
//   State<OperatorCallScreen> createState() => _VideoCOperatorCallScreenState();
// }

// class _VideoCOperatorCallScreenState extends State<OperatorCallScreen> {
//   late IO.Socket socket;
//   RTCPeerConnection? _peerConnection;
//   late MediaStream _localStream;
//   MediaStream? _remoteStream;

//   final RTCVideoRenderer _localRenderer = RTCVideoRenderer();
//   final RTCVideoRenderer _remoteRenderer = RTCVideoRenderer();

//   @override
//   void initState() {
//     super.initState();
//     initialize();
//     initSocket();
//   }

//   void initSocket() {
//     socket = IO.io('${ApiConstants.baseUrl}/operator', {
//       'transports': ['websocket'],
//       'query': {
//         'token': ApiConstants.token,
//       }
//     });

//     socket.onConnect((_) {
//       info('Socket -> connect');
//       socket.emit("operator_status", {'connect': true, 'status': 'available'});
//       setState(() {});
//     });

//     socket.on("user_call", (data) {
//       info('Socket -> user_call: $data');
//       if (data['state'] == 'new') {
//         socket.emit("operator_accept");
//       }
//     });

//     socket.on("message", (data) async {
//       var rtc = data['rtc'];
//       if (rtc != null) {
//         switch (rtc['type']) {
//           case "prepare":
//             socket.emit("message", {
//               "rtc": {"type": "ready", "_to": rtc['_from']}
//             });
//             break;
//           case "offer":
//             _peerConnection = await createPeerConnection({
//               'iceServers': [
//                 {'urls': 'stun:stun.l.google.com:19302'}
//               ]
//             }, {});

//             _peerConnection?.addStream(_localStream);

//             _peerConnection?.onAddStream = (MediaStream stream) {
//               setState(() {
//                 _remoteStream = stream;
//                 _remoteRenderer.srcObject = _remoteStream;
//               });
//             };

//             _peerConnection?.onIceCandidate = (RTCIceCandidate candidate) {
//               socket.emit("message", {
//                 "rtc": {
//                   "type": "candidate",
//                   "candidate": candidate.candidate,
//                   "id": candidate.sdpMid,
//                   "label": candidate.sdpMLineIndex,
//                 }
//               });
//             };
//             _peerConnection?.setRemoteDescription(
//               RTCSessionDescription(rtc['sdp'], rtc['type']),
//             );
//             info("webrtc -> setRemoteDescription");
//             _createAnswer();

//             break;
//           case "candidate":
//             _peerConnection?.addCandidate(
//               RTCIceCandidate(
//                 rtc['candidate'],
//                 rtc['id'],
//                 rtc['label'],
//               ),
//             );
//             break;
//           case "hangup":
//             _peerConnection?.close();
//             break;
//         }
//       }
//     });

//     socket.onDisconnect((_) {
//       info('Socket -> disconnect');
//       socket.emit("message", {
//         "rtc": {"type": "hangup"}
//       });
//     });

//     socket.connect();
//   }

//   void initialize() async {
//     await _localRenderer.initialize();
//     await _remoteRenderer.initialize();

//     _localStream = await navigator.mediaDevices.getUserMedia({
//       'audio': true,
//       'video': {
//         'facingMode': 'user',
//       },
//     });

//     _localRenderer.srcObject = _localStream;

//     _peerConnection = await createPeerConnection({
//       'iceServers': [
//         {'urls': 'stun:stun.l.google.com:19302'}
//       ]
//     }, {});

//     _peerConnection?.addStream(_localStream);

//     _peerConnection?.onAddStream = (MediaStream stream) {
//       setState(() {
//         _remoteStream = stream;
//         _remoteRenderer.srcObject = _remoteStream;
//       });
//     };

//     _peerConnection?.onIceCandidate = (RTCIceCandidate candidate) {
//       socket.emit("message", {
//         "rtc": {
//           "type": "candidate",
//           "candidate": candidate.candidate,
//           "id": candidate.sdpMid,
//           "label": candidate.sdpMLineIndex,
//         }
//       });
//     };
//   }

//   void _createAnswer() async {
//     try {
//       RTCSessionDescription? description =
//           await _peerConnection?.createAnswer();
//       await _peerConnection?.setLocalDescription(description!);
//       socket.emit("message", {
//         "rtc": {"type": description?.type, "sdp": description?.sdp}
//       });
//     } catch (e) {
//       fatal('Error creating answer: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Jahongir'),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             onPressed: () {
//               setState(() {});
//             },
//             icon: const Icon(Icons.more_vert_sharp),
//           ),
//         ],
//       ),
//       body: Stack(
//         children: [
//           RTCVideoView(_remoteRenderer),
//           Positioned(
//             bottom: 20,
//             right: 20,
//             child: SizedBox(
//               width: 120,
//               height: 200,
//               child: DecoratedBox(
//                 decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(8)),
//                 ),
//                 child: ClipRRect(
//                   borderRadius: const BorderRadius.all(Radius.circular(8)),
//                   child: RTCVideoView(
//                     _localRenderer,
//                     mirror: true,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomAppBar(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             IconButton(
//               onPressed: () {
//                 _localStream.getVideoTracks().forEach((track) {
//                   track.enabled = !track.enabled;
//                 });
//                 setState(() {});
//               },
//               icon: Icon(
//                 _localStream.getVideoTracks().first.enabled
//                     ? Icons.videocam
//                     : Icons.videocam_off,
//               ),
//             ),
//             IconButton(
//               onPressed: () {
//                 _localStream.getAudioTracks().forEach((track) {
//                   track.enabled = !track.enabled;
//                 });
//                 setState(() {});
//               },
//               icon: Icon(
//                 _localStream.getAudioTracks().first.enabled
//                     ? Icons.mic
//                     : Icons.mic_off,
//               ),
//             ),
//             // change camera
//             IconButton(
//               onPressed: () {
//                 _localStream.getVideoTracks().forEach((track) {
//                   track.switchCamera();
//                 });
//               },
//               icon: const Icon(Icons.switch_camera),
//             ),
//              IconButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const ChatScreen(),
//                   ),
//                 );
//               },
//               icon: const Icon(Icons.message_outlined),
//             ),
//             FloatingActionButton(
//               backgroundColor: Colors.red,
//               onPressed: () {
//                 socket.emit("message", {
//                   "rtc": {"type": "hangup"}
//                 });
//                 Navigator.pop(context);
//               },
//               shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(30)),
//               ),
//               child: const Icon(
//                 Icons.call_end,
//                 color: Colors.white,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _localStream.dispose();
//     _peerConnection?.close();
//     _localRenderer.dispose();
//     _remoteRenderer.dispose();
//     socket.dispose();
//     super.dispose();
//   }
// }

