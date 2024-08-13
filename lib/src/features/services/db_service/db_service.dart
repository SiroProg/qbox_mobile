import 'package:shared_preferences/shared_preferences.dart';

enum StorageKeys {
  isLogin('isLogin'),
  id('id'),
  token('token'),
  notificationId('notificationId');

  const StorageKeys(this.key);
  final String key;
}

late final SharedPreferences $storage;

class DBService {
  static Future<void> initialize() async {
    $storage = await SharedPreferences.getInstance();
  }

  static String get token {
    return $storage.getString(StorageKeys.token.name) ?? '';
  }

  static set token(String token) {
    $storage.setString(StorageKeys.token.name, token);
  }

  static int get id {
    return $storage.getInt(StorageKeys.id.name) ?? -1;
  }

  static set id(int id) {
    $storage.setInt(StorageKeys.id.name, id);
  }

  static bool get isLogin {
    return $storage.getBool(StorageKeys.isLogin.name) ?? false;
  }

  static int get notificationId {
    return $storage.getInt(StorageKeys.notificationId.name) ?? 0;
  }

  static set notificationId(int notificationId) {
    $storage.setInt(StorageKeys.notificationId.name, notificationId);
  }
}
