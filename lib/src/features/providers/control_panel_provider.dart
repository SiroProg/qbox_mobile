import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../../core/models/auth_models/employee_model.dart';
import '../../core/models/control_panel_models/call_operator_model.dart';
import '../../core/models/control_panel_models/call_team_model.dart';
import '../../core/models/control_panel_models/missed_calls_model.dart';
import '../../core/models/control_panel_models/perfomens_model.dart';
import '../../core/models/control_panel_models/status_model.dart';
import '../../core/models/control_panel_models/сonversation_model.dart';

class ControlPanelProvider extends ChangeNotifier {
  late Employee employee;
  final ScrollController scrollController = ScrollController();
  final PageController pageController = PageController();
  List<CallOperatorModel> callOperators = [];
  CallTeamModel callTeams = CallTeamModel(text: [], audio: [], video: []);
   List<ConversationModel> conversations = [];
  List<Call> missedCalls = [];

  PerformanceModel? performance;
  Status? initialStatus;
  Stopwatch stopwatch = Stopwatch();
  Timer? timer;
  String elapsedTime = '00:00:00';
  int initialButtonIndex = 0;
  List<Status> statuses = [];

  void changeStatus(Status status) {
    initialStatus = status;
    notifyListeners();
  }

  void initEmployee(Employee employee) {
    this.employee = employee;
  }

  void startStopwatch() {
    stopwatch.reset();
    stopwatch.start();
    startTimer();
  }

  void scrollToCenter(int index, BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonWidth = 160.0;
    final targetPosition =
        index * (buttonWidth + 10) - screenWidth / 2 + buttonWidth / 2;

    scrollController.animateTo(
      targetPosition,
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
    );
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      elapsedTime = formatTime(stopwatch.elapsedMilliseconds);
      notifyListeners();
    });
  }

  void stopStopwatch() {
    stopwatch.stop();
    if (timer != null) {
      timer!.cancel();
    }
    notifyListeners();
  }

  String formatTime(int milliseconds) {
    int seconds = (milliseconds / 1000).truncate();
    int hours = (seconds / 3600).truncate();
    seconds = seconds % 3600;
    int minutes = (seconds / 60).truncate();
    seconds = seconds % 60;
    return '${hours.toString().padLeft(2, '0')}:'
        '${minutes.toString().padLeft(2, '0')}:'
        '${seconds.toString().padLeft(2, '0')}';
  }

  String getFormattedDateTime(int startedAt, [String? format]) {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(startedAt * 1000);
    final year = dateTime.year.toString().padLeft(4, '0');
    final month = dateTime.month.toString().padLeft(2, '0');
    final day = dateTime.day.toString().padLeft(2, '0');
    final hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');
    final second = dateTime.second.toString().padLeft(2, '0');
    switch (format) {
      case 'dd.MM.yyyy, HH:mm:ss':
        return '$day.$month.$year, $hour:$minute:$second';
      case 'dd.MM.yyyy':
        return '$day.$month.$year';
      case 'HH:mm:ss':
        return '$hour:$minute:$second';
      case 'mm:ss':
        return '$minute:$second';
      default:
        return '$day.$month.$year, $hour:$minute:$second';
    }
    return '$day.$month.$year, $hour:$minute:$second';
  }

  void changePage(int index) {
    pageController.jumpToPage(index);
  }
}
