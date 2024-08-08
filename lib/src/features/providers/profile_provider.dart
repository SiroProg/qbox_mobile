import 'package:flutter/cupertino.dart';

class ProfileProvider extends ChangeNotifier {
  DateTime selectedDateFromLogs = DateTime.now();

  String formatUnixTimeToTime(int unixTime) {
    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(unixTime * 1000, isUtc: true);

    String hour = dateTime.hour.toString().padLeft(2, '0');
    String minute = dateTime.minute.toString().padLeft(2, '0');
    String second = dateTime.second.toString().padLeft(2, '0');

    return '$hour:$minute:$second';
  }

  void setSelectedDateFromLogs(DateTime date) {
    selectedDateFromLogs = date;
    notifyListeners();
  }
}
