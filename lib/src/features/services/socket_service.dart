import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:qbox_mobile/src/core/constants/api_constants.dart';
import 'package:qbox_mobile/src/features/providers/chat_provider.dart';
// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../../core/utils/logger.dart';
import 'db_service/db_service.dart';

class SocketService {
  late IO.Socket socket;

  void initSocket(BuildContext context) {
    final chatProvider = Provider.of<ChatProvider>(context, listen: false);

    socket = IO.io('${ApiConstants.baseUrl}/operator', {
      'transports': ['websocket'],
      'query': {
        'token': DBService.token,
      }
    });

    socket.onConnect((_) {
      info('Socket -> connect');
      socket.emit("operator_status", {'connect': true, 'status': 'available'});
    });

    socket.on("operator_status", (data) {
      info('Socket -> operator_status: $data');
    });

    socket.onError((error) {
      info('Socket -> error: $error');
    });

    socket.on("user_call", (data) {
      info('Socket -> user_call: $data');

      if (data['state'] == 'new') {
        chatProvider.onUserCall(data);
      }
    });

    socket.on("message", (data) {
      socket.off("message");

      info('Socket -> message: $data');
      chatProvider.onMessage(data);
    });

    socket.onDisconnect((_) {
      info('Socket -> disconnect');
      socket.emit("message", {
        "rtc": {"type": "hangup"}
      });
    });

    socket.connect();
  }

  void startOperatorStatus() {
    socket.emit('operator_status', {'status': 'available', 'connect': true});
  }

  void updateOperatorStatus(String status) {
    socket.emit("operator_status", {'status': status});
  }

  void redirectOperator({
    required String toOperator,
    required String targetOperator,
    required String chatId,
  }) {
    socket.emit('operator_redirect', {
      'to': toOperator,
      'target': targetOperator,
      'chat': chatId,
    });

    info(
        'Redirecting operator: from $toOperator to $targetOperator with chat ID: $chatId');
  }

  void dispose() {
    socket.disconnect();
    info('Socket -> dispose');
  }
}

SocketService socketService = SocketService();
