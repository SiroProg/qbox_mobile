import 'package:qbox_mobile/src/features/services/operator_call_service/operator_api_service.dart';
import 'package:qbox_mobile/src/core/models/operator_call/operator_models/call_user_model.dart';
import 'package:qbox_mobile/src/core/models/operator_call/operator_models/upload_model.dart';
import 'package:qbox_mobile/src/features/pages/operator_screen/operator_call_screen.dart';
import 'package:qbox_mobile/src/features/pages/operator_screen/widget/call_screen.dart';
import 'package:qbox_mobile/src/core/models/operator_call/operator_models/chat.dart';
import 'package:qbox_mobile/src/features/services/db_service/db_service.dart';
import 'package:qbox_mobile/src/core/constants/api_constants.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:qbox_mobile/src/core/utils/get_url_size.dart';
import 'package:qbox_mobile/src/core/styles/app_audios.dart';
import 'package:qbox_mobile/src/core/utils/file_picker.dart';
import 'package:qbox_mobile/src/core/utils/logger.dart';
import 'package:qbox_mobile/src/features/services/socket_service.dart';

import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  String? chatId;
  BuildContext? context;

  bool isSwitched = false;

  bool isTyping = false;

  List<Chat> chatMessages = [];

  String? message;
  final ScrollController scrollController = ScrollController();

  final TextEditingController _controller = TextEditingController();

  TextEditingController get controller => _controller;

  ///------
  // late IO.Socket operatorSocket;

  RTCPeerConnection? _peerConnection;
  MediaStream? _localStream;
  MediaStream? _remoteStream;
  final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();

  CallUserModel? callUserModel;

  final RTCVideoRenderer _localRenderer = RTCVideoRenderer();
  final RTCVideoRenderer _remoteRenderer = RTCVideoRenderer();

  RTCVideoRenderer get localRenderer => _localRenderer;
  RTCVideoRenderer get remoteRenderer => _remoteRenderer;
  MediaStream? get localStream => _localStream;

  Offset widgetPosition = const Offset(20, 20);

  List<String> readyMessages = [
    'Hello, how can I help you?',
    'I am here to help you',
    'I am ready to help you',
    'How can I assist you today?',
    'Feel free to ask any questions.',
    'Let me know how I can help you.',
  ];

  void setSwitched(bool value) {
    isSwitched = value;
    notifyListeners();
  }

  void updateWidgetPosition(Offset newPosition) {
    widgetPosition = newPosition;
    notifyListeners();
  }

  void setMessage(String value) {
    controller.text = value;
    message = value;
    notifyListeners();
  }

  void setBuildContext(BuildContext context) => this.context = context;

  void onUserCall(dynamic data) {
    callUserModel = CallUserModel.fromJson(data['caller']);
    notifyListeners();
    callDialog();
  }

  void onMessage(dynamic data) {
    // Message RTC
    socketService.socket.on("message", (data) async {
      final rtc = data['rtc'];
      if (rtc != null) {
        switch (rtc['type']) {
          case "prepare":
            socketService.socket.emit("message", {
              "rtc": {"type": "ready", "_to": rtc['_from']}
            });
            break;
          case "offer":
            if (_localStream != null) {
              await _handleOffer(rtc);
            } else {
              fatal('Error handling offer: _localStream is null');
            }
            break;
          case "candidate":
            _peerConnection?.addCandidate(
              RTCIceCandidate(
                rtc['candidate'],
                rtc['id'],
                rtc['label'],
              ),
            );
            break;
          case "hangup":
            _peerConnection?.close();
            chatMessages.clear();
            notifyListeners();
            break;
        }
      }
    });

    socketService.socket.on('message', (data) async {
      info('Socket -> message909090: $data');

      if (data['media'] == null || data['media'].isEmpty) {
        chatId = data['chat'];

        chatMessages.add(Chat(
          message: data['text'],
          senderToken: data['sender'],
          time: DateTime.now(),
        ));

        AssetsAudioPlayer.newPlayer().open(
          Audio(AppAudios.notification),
          autoStart: true,
          showNotification: true,
        );

        scrollController.animateTo(
          scrollController.position.maxScrollExtent + 50,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );

        notifyListeners();
      } else if (data['media'] != null && data['media']['type'] == 'image') {
        String imageUrl = data['media']['image'];
        AssetsAudioPlayer.newPlayer().open(
          Audio(AppAudios.notification),
          autoStart: true,
          showNotification: true,
        );
        chatMessages.add(
          Chat(
            message: imageUrl,
            senderToken: data['sender'],
            time: DateTime.now(),
            size: await getFileSizeInMB(imageUrl),
          ),
        );
        scrollController.animateTo(
          scrollController.position.maxScrollExtent + 200,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );

        notifyListeners();
      } else if (data['media'] != null && data['media']['type'] == 'file') {
        String imageUrl = data['media']['file'];
        info('File name: ${data['media']['name']}');
        final String? fileName = data['media']['name'];

        scrollController.animateTo(
          scrollController.position.maxScrollExtent + 250,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
        chatMessages.add(
          Chat(
            message: imageUrl,
            senderToken: data['sender'],
            time: DateTime.now(),
            fileName: fileName,
            size: await getFileSizeInMB(imageUrl),
          ),
        );
        AssetsAudioPlayer.newPlayer().open(
          Audio(AppAudios.notification),
          autoStart: true,
          showNotification: true,
        );

        // chatMessages = chatMessages.toSet().toList();
        scrollController.animateTo(
          scrollController.position.maxScrollExtent + 110,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
        notifyListeners();
      }
    });
  }

  void sendMessage() {
    if (message != null && message!.trim().isNotEmpty) {
      chatMessages.add(Chat(
        message: message!,
        senderToken: DBService.token,
        time: DateTime.now(),
      ));

      socketService.socket.emit('operator_message', {
        'key': 'new',
        'text': message,
        'sender': DBService.token,
      });

      scrollController.animateTo(
        scrollController.position.maxScrollExtent + 50,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );

      _controller.clear();
      message = null;

      notifyListeners();
    }
  }

  void sendFile() async {
    FilePickerUtils pickFile = FilePickerUtils();
    final file = await pickFile.pickFile();

    UploadModel? upload = await OperatorService.upload(
      filePath: file.xFiles[0].path,
      type: 'file',
    );

    info('File name: ${upload!.title} ${upload.url}');

    socketService.socket.emit('operator_message', {
      'key': 'new',
      'file': upload.url,
      'hash': upload.hash,
      'title': upload.title,
      'chat': chatId,
    });

    final chat = Chat(
      message: "${ApiConstants.baseUrl}${upload.url}",
      senderToken: DBService.token,
      time: DateTime.now(),
      fileName: upload.title,
      size: await getFileSizeInMB('${ApiConstants.baseUrl}${upload.url}'),
    );

    chatMessages.add(chat);

    notifyListeners();
  }

////  ----------

  void callDialog() {
    _assetsAudioPlayer.open(
      Audio(AppAudios.call),
      autoStart: true,
      showNotification: true,
    );

    Navigator.push(
      context!,
      MaterialPageRoute(
        builder: (context) => CallScreen(
          onAccept: () {
            socketService.socket.emit("operator_accept");

            _assetsAudioPlayer.stop();

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const OperatorCallScreen(),
              ),
            );
          },
          onCancel: () {
            socketService.socket.emit("operator_reject");
            socketService.socket.emit("operator_cancel");

            _assetsAudioPlayer.stop();
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  Future<void> initialize() async {
    await _localRenderer.initialize();
    await _remoteRenderer.initialize();

    try {
      _localStream = await navigator.mediaDevices.getUserMedia({
        'audio': true,
        'video': {
          'facingMode': 'user',
        },
      });

      _localRenderer.srcObject = _localStream;

      _peerConnection = await createPeerConnection({
        'iceServers': [
          {'urls': 'stun:stun.l.google.com:19302'}
        ]
      }, {});

      _peerConnection?.addStream(_localStream!);

      _peerConnection?.onAddStream = (MediaStream stream) {
        _remoteStream = stream;
        _remoteRenderer.srcObject = _remoteStream;
        notifyListeners();
      };

      _peerConnection?.onIceCandidate = (RTCIceCandidate candidate) {
        socketService.socket.emit("message", {
          "rtc": {
            "type": "candidate",
            "candidate": candidate.candidate,
            "id": candidate.sdpMid,
            "label": candidate.sdpMlineIndex,
          }
        });
      };
    } catch (e) {
      fatal('Error during initialization: $e');
    }
    notifyListeners();
  }

  Future<void> _handleOffer(dynamic rtc) async {
    try {
      if (_peerConnection != null) {
        await _peerConnection?.close();
        _peerConnection = null;
      }

      _peerConnection = await createPeerConnection({
        'iceServers': [
          {'urls': 'stun:stun.l.google.com:19302'}
        ]
      }, {});

      _peerConnection?.addStream(_localStream!);

      _peerConnection?.onAddStream = (MediaStream stream) {
        _remoteStream = stream;
        _remoteRenderer.srcObject = _remoteStream;
        notifyListeners();
      };

      _peerConnection?.onIceCandidate = (RTCIceCandidate candidate) {
        socketService.socket.emit("message", {
          "rtc": {
            "type": "candidate",
            "candidate": candidate.candidate,
            "id": candidate.sdpMid,
            "label": candidate.sdpMlineIndex,
          }
        });
      };

      await _peerConnection?.setRemoteDescription(
        RTCSessionDescription(rtc['sdp'], rtc['type']),
      );
      info("webrtc -> setRemoteDescription");

      RTCSessionDescription? description =
          await _peerConnection?.createAnswer();
      if (description != null) {
        await _peerConnection?.setLocalDescription(description);
        socketService.socket.emit("message", {
          "rtc": {"type": description.type, "sdp": description.sdp}
        });
      }
    } catch (e) {
      fatal('Error handling offer: $e');
    }
  }

  void toggleVideo() {
    if (_localStream != null) {
      _localStream!.getVideoTracks().forEach((track) {
        track.enabled = !track.enabled;
      });
      notifyListeners();
    }
  }

  void toggleAudio() {
    if (_localStream != null) {
      _localStream!.getAudioTracks().forEach((track) {
        track.enabled = !track.enabled;
      });
      notifyListeners();
    }
  }

  void switchCamera() {
    if (_localStream != null) {
      _localStream!.getVideoTracks().forEach((track) {
        // ignore: deprecated_member_use
        track.switchCamera();
      });
    }
  }

  void hangUp() {
    socketService.socket.emit("message", {
      "rtc": {"type": "hangup"}
    });

    chatMessages.clear();
    _peerConnection?.close();
    _localStream?.dispose();
    _remoteStream?.dispose();
    _localRenderer.dispose();
    _remoteRenderer.dispose();
    socketService.socket.dispose();
  }

  // void disableSocket() {
  //   if (operatorSocket.connected) {
  //     operatorSocket.emit("message", {
  //       "rtc": {"type": "hangup"}
  //     });
  //     operatorSocket.disconnect();
  //     operatorSocket.dispose();
  //   }
  // }

  @override
  void dispose() {
    _localRenderer.dispose();
    _remoteRenderer.dispose();
    super.dispose();
  }
}

// import 'package:assets_audio_player/assets_audio_player.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_webrtc/flutter_webrtc.dart';
// import 'package:learn_webrtc/src/core/constants/api_constants.dart';
// import 'package:learn_webrtc/src/core/style/app_audios.dart';
// import 'package:learn_webrtc/src/core/utils/file_pickerr.dart';
// import 'package:learn_webrtc/src/core/utils/get_url_size.dart';
// import 'package:learn_webrtc/src/features/operator/model/call_user_model.dart';
// import 'package:learn_webrtc/src/features/operator/model/chat.dart';
// import 'package:learn_webrtc/src/features/operator/model/upload_model.dart';
// import 'package:learn_webrtc/src/features/operator/operator_call_screen.dart';
// import 'package:learn_webrtc/src/features/operator/service/operator_api_service.dart';
// import 'package:learn_webrtc/src/core/service/socket_service.dart';
// import 'package:learn_webrtc/src/features/operator/widget/call_screen.dart';
// import 'package:learn_webrtc/src/core/utils/logger.dart';

// class ChatProvider extends ChangeNotifier {
//   String? chatId;
//   BuildContext? context;

//   bool isTyping = false;
//   List<Chat> chatMessages = [];
//   String? message;

//   final ScrollController scrollController = ScrollController();
//   final TextEditingController _controller = TextEditingController();
//   final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();

//   final SocketService _socketService = SocketService();
//   RTCPeerConnection? _peerConnection;
//   MediaStream? _localStream;
//   MediaStream? _remoteStream;

//   CallUserModel? callUserModel;

//   final RTCVideoRenderer _localRenderer = RTCVideoRenderer();
//   final RTCVideoRenderer _remoteRenderer = RTCVideoRenderer();

//   TextEditingController get controller => _controller;
//   RTCVideoRenderer get localRenderer => _localRenderer;
//   RTCVideoRenderer get remoteRenderer => _remoteRenderer;
//   MediaStream? get localStream => _localStream;

//   final List<String> readyMessages = [
//     'Hello, how can I help you?',
//     'I am here to help you',
//     'I am ready to help you',
//     'How can I assist you today?',
//     'Feel free to ask any questions.',
//     'Let me know how I can help you.',
//   ];

//   void setMessage(String value) {
//     controller.text = value;
//     message = value;
//     notifyListeners();
//   }

//   void setBuildContext(BuildContext context) => this.context = context;

//   void initSocket() {
//     _socketService.initialize(
//       onMessage: _handleSocketMessage,
//       onCall: _handleUserCall,
//     );
//   }

//   void _handleUserCall(dynamic data) {
//     callUserModel = CallUserModel.fromJson(data['caller']);
//     notifyListeners();
//     _showCallDialog();
//   }

//   Future<void> _handleSocketMessage(dynamic data) async {
//     final rtc = data['rtc'];
//     if (rtc != null) {
//       await _handleRtcMessage(rtc);
//     } else {
//       await _handleChatMessage(data);
//     }
//   }

//   Future<void> _handleRtcMessage(dynamic rtc) async {
//     switch (rtc['type']) {
//       case "prepare":
//         _socketService.emit("message", {
//           "rtc": {"type": "ready", "_to": rtc['_from']}
//         });
//         break;
//       case "offer":
//         if (_localStream != null) {
//           await _handleOffer(rtc);
//         } else {
//           fatal('Error handling offer: _localStream is null');
//         }
//         break;
//       case "candidate":
//         _peerConnection?.addCandidate(
//           RTCIceCandidate(rtc['candidate'], rtc['id'], rtc['label']),
//         );
//         break;
//       case "hangup":
//         await _hangUp();
//         break;
//     }
//   }

//   Future<void> _handleChatMessage(dynamic data) async {
//     chatId = data['chat'];
//     final media = data['media'];
//     final message = Chat(
//       message: media == null || media.isEmpty
//           ? data['text']
//           : media['image'] ?? media['file'],
//       senderToken: data['sender'],
//       time: DateTime.now(),
//       fileName: media != null ? media['name'] : null,
//       size: media != null
//           ? await getFileSizeInMB(media['image'] ?? media['file'])
//           : null,
//     );

//     chatMessages.add(message);
//     _playNotificationSound();
//     _scrollToBottom();

//     notifyListeners();
//   }

//   void sendMessage() {
//     if (message?.trim().isNotEmpty ?? false) {
//       _addChatMessage(message!);
//       _socketService.emit('operator_message', {
//         'key': 'new',
//         'text': message,
//         'sender': ApiConstants.token,
//       });
//       _clearMessage();
//     }
//   }

//   Future<void> sendFile() async {
//     final file = await FilePickerUtils().pickFile();
//     UploadModel? upload = await OperatorService.upload(
//       filePath: file.xFiles[0].path,
//       type: 'file',
//     );
//     if (upload == null) return;

//     _socketService.emit('operator_message', {
//       'key': 'new',
//       'file': upload.url,
//       'hash': upload.hash,
//       'title': upload.title,
//       'chat': chatId,
//     });

//     final chat = Chat(
//       message: "${ApiConstants.baseUrl}${upload.url}",
//       senderToken: ApiConstants.token,
//       time: DateTime.now(),
//       fileName: upload.title,
//       size: await getFileSizeInMB('${ApiConstants.baseUrl}${upload.url}'),
//     );

//     chatMessages.add(chat);
//     notifyListeners();
//   }

//   void _showCallDialog() {
//     _playCallSound();
//     Navigator.push(
//       context!,
//       MaterialPageRoute(
//         builder: (context) => CallScreen(
//           onAccept: _acceptCall,
//           onCancel: _cancelCall,
//         ),
//       ),
//     );
//   }

//   Future<void> _acceptCall() async {
//     _socketService.emit("operator_accept", '');
//     _stopCallSound();
//     await Navigator.pushReplacement(
//       context!,
//       MaterialPageRoute(builder: (context) => const OperatorCallScreen()),
//     );
//   }

//   void _cancelCall() {
//     _socketService.emit("operator_cancel", '');
//     _socketService.emit("operator_reject", '');
//     _stopCallSound();
//     Navigator.pop(context!);
//     initSocket();
//   }

//   Future<void> initialize() async {
//     await _initializeRenderers();
//     await _initializeLocalStream();
//     await _initializePeerConnection();
//     notifyListeners();
//   }

//   Future<void> _initializeRenderers() async {
//     await _localRenderer.initialize();
//     await _remoteRenderer.initialize();
//   }

//   Future<void> _initializeLocalStream() async {
//     _localStream = await navigator.mediaDevices.getUserMedia({
//       'audio': true,
//       'video': {'facingMode': 'user'},
//     });
//     _localRenderer.srcObject = _localStream;
//   }

//   Future<void> _initializePeerConnection() async {
//     _peerConnection = await createPeerConnection({
//       'iceServers': [
//         {'urls': 'stun:stun.l.google.com:19302'}
//       ],
//     });

//     _peerConnection?.addStream(_localStream!);

//     _peerConnection?.onAddStream = (MediaStream stream) {
//       _remoteStream = stream;
//       _remoteRenderer.srcObject = _remoteStream;
//       notifyListeners();
//     };

//     _peerConnection?.onIceCandidate = (RTCIceCandidate candidate) {
//       _socketService.emit("message", {
//         "rtc": {
//           "type": "candidate",
//           "candidate": candidate.candidate,
//           "id": candidate.sdpMid,
//           "label": candidate.sdpMlineIndex,
//         }
//       });
//     };
//   }

//   Future<void> _handleOffer(dynamic rtc) async {
//     try {
//       await _closeExistingPeerConnection();
//       await _initializePeerConnection();

//       await _peerConnection?.setRemoteDescription(
//         RTCSessionDescription(rtc['sdp'], rtc['type']),
//       );
//       info("webrtc -> setRemoteDescription");

//       final description = await _peerConnection?.createAnswer();
//       if (description != null) {
//         await _peerConnection?.setLocalDescription(description);
//         _socketService.emit("message", {
//           "rtc": {"type": description.type, "sdp": description.sdp},
//         });
//       }
//     } catch (e) {
//       fatal('Error handling offer: $e');
//     }
//   }

//   Future<void> _closeExistingPeerConnection() async {
//     await _peerConnection?.close();
//     _peerConnection = null;
//   }

//   void toggleVideo() {
//     _toggleTrackState(_localStream?.getVideoTracks());
//   }

//   void toggleAudio() {
//     _toggleTrackState(_localStream?.getAudioTracks());
//   }

//   void switchCamera() {
//     _localStream?.getVideoTracks().forEach((track) {
//       // ignore: deprecated_member_use
//       track.switchCamera();
//     });
//   }

//   void _toggleTrackState(List<MediaStreamTrack>? tracks) {
//     tracks?.forEach((track) {
//       track.enabled = !track.enabled;
//     });
//   }

//   void _addChatMessage(String message) {
//     chatMessages.add(
//       Chat(
//         message: message,
//         senderToken: ApiConstants.token,
//         time: DateTime.now(),
//       ),
//     );
//     notifyListeners();
//   }

//   void _clearMessage() {
//     controller.clear();
//     message = '';
//     notifyListeners();
//   }

//   void _playNotificationSound() {
//     _assetsAudioPlayer.open(Audio(AppAudios.notification),
//         autoStart: true, showNotification: false);
//   }

//   void _playCallSound() {
//     _assetsAudioPlayer.open(Audio(AppAudios.call),
//         autoStart: true, showNotification: false);
//   }

//   void _stopCallSound() => _assetsAudioPlayer.stop();

//   Future<void> _hangUp() async {
//     await _peerConnection?.close();
//     _peerConnection = null;
//     _socketService.emit("message", {
//       "rtc": {"type": "hangup"}
//     });
//   }

//   void _scrollToBottom() {
//     if (scrollController.hasClients) {
//       scrollController.animateTo(
//         scrollController.position.maxScrollExtent,
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.easeOut,
//       );
//     }
//   }

//   @override
//   void dispose() {
//     _localRenderer.dispose();
//     _remoteRenderer.dispose();
//     _socketService.dispose();
//     super.dispose();
//   }
// }
