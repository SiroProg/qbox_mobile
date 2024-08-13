import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:qbox_mobile/src/features/services/db_service/db_service.dart';
import 'package:qbox_mobile/src/core/utils/logger.dart';

late FlutterLocalNotificationsPlugin $flutterLocalNotificationsPlugin;

class NotificationService {
  static Future<void> initialize() async {
    $flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await $flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static void showNotification(String message) async {
    try {
      final id = DBService.notificationId++;

      AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails(
        '$id',
        'New messages',
        importance: Importance.max,
        priority: Priority.high,
        showWhen: false,
      );

      NotificationDetails platformChannelSpecifics =
          NotificationDetails(android: androidPlatformChannelSpecifics);

      await $flutterLocalNotificationsPlugin.show(
        id,
        'Q19 Notification',
        message,
        platformChannelSpecifics,
        payload: 'item x',
      );
      info('Notification sent');
    } catch (e) {
      warning('Notification error $e');
    }
  }
}
