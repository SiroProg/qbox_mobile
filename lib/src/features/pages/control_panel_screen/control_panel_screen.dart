import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/models/auth_models/employee_model.dart';
import '../../../core/models/control_panel_models/status_model.dart';
import '../../../core/styles/app_colors.dart';
import '../../providers/control_panel_provider.dart';
import '../../services/control_panel_service/control_panel_service.dart';
import '../../services/socket_service.dart';
import 'widgets/body_detayl_panel.dart';
import 'widgets/body_pageview_panel.dart';
import 'widgets/headers_panel.dart';

class VideoScreen extends StatefulWidget {
  final Employee employee;
  const VideoScreen({super.key, required this.employee});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  List<Status> statuses = [];
  bool isInit = false;

  @override
  void initState() {
    super.initState();
  }

  void loadStatuses() async {
    final panelProvider = Provider.of<ControlPanelProvider>(context);
    statuses = await ControlPanelService().fetchOperatorStatuses();
    socketService.startOperatorStatus();
    panelProvider.performance =
        await ControlPanelService().fetchOperatorPerformance();
    panelProvider.conversations =
        await ControlPanelService().fetchConversations(page: 1, limit: 10);
    panelProvider.missedCalls =
        await ControlPanelService().fetchMissedCalls(page: 1, limit: 10);
    panelProvider.statuses = statuses;
    panelProvider.changeStatus(
      statuses.firstWhere((status) => status.key == 'available'),
    );
    panelProvider.callOperators = await ControlPanelService().fetchOperators();
    panelProvider.callTeams = await ControlPanelService().fetchCallTeams();
  }

  @override
  Widget build(BuildContext context) {
    final panelProvider = Provider.of<ControlPanelProvider>(context);

    if (!isInit) {
      panelProvider.initEmployee(widget.employee);
      panelProvider.startStopwatch();
      loadStatuses();
      isInit = true;
    }

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const Text('Панель управления'),
      ),
      body: const SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeadersPanel(),
              SizedBox(height: 20),
              BodyDetaylPanel(),
              BodyPageviewPanel(),
            ],
          ),
        ),
      ),
    );
  }
}
