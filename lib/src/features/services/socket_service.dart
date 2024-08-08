import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../../core/utils/logger.dart';
import 'db_service/db_service.dart';

class SocketService {
  static late IO.Socket socket;

  static void initSocket() {
    socket = IO.io('https://inqbox.q19.kz/operator', {
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

    socket.connect();
  }

  static void startOperatorStatus() {
    socket.emit('operator_status', {'status': 'available', 'connect': true});
  }

  static void updateOperatorStatus(String status) {
    socket.emit("operator_status", {'status': status});
  }
}
