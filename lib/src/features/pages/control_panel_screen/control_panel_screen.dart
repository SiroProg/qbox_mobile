import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:qbox_mobile/src/features/providers/chat_provider.dart';
import 'package:qbox_mobile/src/features/services/db_service/db_service.dart';
import '../../../core/constants/api_constants.dart';
import '../../../core/models/auth_models/employee_model.dart';
import '../../../core/models/control_panel_models/status_model.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_svg.dart';
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
    final chatProvider = Provider.of<ChatProvider>(context, listen: false);
    chatProvider.initialize();

    super.initState();
  }

  void loadStatuses(BuildContext context) async {
    final panelProvider =
        Provider.of<ControlPanelProvider>(context, listen: false);
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
    setState(() {});
    print('done');
  }

  @override
  Widget build(BuildContext context) {
    final panelProvider = Provider.of<ControlPanelProvider>(context);

    if (!isInit) {
      panelProvider.initEmployee(widget.employee);
      panelProvider.startStopwatch();

      DBService.id = panelProvider.employee.id;
      loadStatuses(context);

      isInit = true;
      setState(() {});
    }

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.white,

        appBar: AppBar(
          toolbarHeight: 70,
          leading: const SizedBox(),
          leadingWidth: 0,
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SafeArea(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        backgroundColor: AppColors.white,
                        context: context,
                        builder: (context) => CupertinoActionSheet(
                          title: const Text('Выберите статус'),
                          actions: List.generate(
                            panelProvider.statuses.where((index) {
                              return index.details.show;
                            }).length,
                            (index) {
                              final Status status =
                                  panelProvider.statuses.where((index) {
                                return index.details.show;
                              }).toList()[index];
                              return CupertinoActionSheetAction(
                                onPressed: () {
                                  if (status.title !=
                                      panelProvider.initialStatus!.title) {
                                    panelProvider.changeStatus(status);
                                    panelProvider.startStopwatch();
                                    socketService
                                        .updateOperatorStatus(status.key);
                                  }
                                  Navigator.pop(context);
                                },
                                child: status == panelProvider.initialStatus
                                    ? Row(
                                        children: [
                                          SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: SvgPicture.network(
                                              fit: BoxFit.cover,
                                              ApiConstants.baseUrl +
                                                  status.icon!,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            status.title,
                                            style: const TextStyle(
                                              color: AppColors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const Spacer(),
                                          const Icon(Icons.check,
                                              color: AppColors.green),
                                        ],
                                      )
                                    : Row(
                                        children: [
                                          SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: SvgPicture.network(
                                              fit: BoxFit.cover,
                                              ApiConstants.baseUrl +
                                                  status.icon!,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            status.title,
                                            style: const TextStyle(
                                              color: AppColors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                              );
                            },
                          ),
                          cancelButton: CupertinoActionSheetAction(
                            onPressed: () {
                              panelProvider.stopStopwatch();
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Отмена',
                              style: TextStyle(
                                color: AppColors.black,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: panelProvider.getStatusColor(
                                panelProvider.initialStatus?.key ??
                                    'available'),
                            width: 3,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(100),
                          ),
                          image: panelProvider.employee.photo != null
                              ? DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    ApiConstants.baseUrl +
                                        panelProvider.employee.photo!,
                                  ),
                                )
                              : null,
                        ),
                        child: panelProvider.employee.photo == null
                            ? Center(
                                child: Text(
                                  panelProvider.employee.firstName[0] +
                                      panelProvider.employee.lastName[0],
                                  style:
                                      const TextStyle(color: AppColors.black10),
                                ),
                              )
                            : null,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${panelProvider.employee.firstName ?? ""} ${panelProvider.employee.lastName ?? ""}",
                        style: const TextStyle(
                          color: AppColors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 15),
                      const SizedBox(height: 5),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.string(
                                  AppSvg.star,
                                  width: 18,
                                  height: 18,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  panelProvider
                                      .getFeedbackAverage()
                                      .toStringAsFixed(2),
                                  style: const TextStyle(
                                    color: AppColors.black10,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 30),
                            Row(
                              children: [
                                SvgPicture.string(
                                  AppSvg.incomingCall,
                                  width: 20,
                                  height: 20,
                                ),
                                const SizedBox(width: 5),
                                const Text(
                                  '65',
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 30),
                            Row(
                              children: [
                                SvgPicture.string(
                                  AppSvg.outgoingCall,
                                  width: 20,
                                  height: 20,
                                ),
                                const SizedBox(width: 5),
                                const Text(
                                  '6',
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 30),
                            Row(
                              children: [
                                SvgPicture.string(
                                  AppSvg.clock,
                                  width: 20,
                                  height: 20,
                                ),
                                const SizedBox(width: 5),
                                const Text(
                                  '0',
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          bottom: const TabBar(
            indicatorColor: AppColors.green,
            labelStyle: TextStyle(
              color: AppColors.black,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
            tabs: [
              Tab(text: 'Принятые'),
              Tab(text: 'Пропущенные'),
              Tab(text: 'Задачи'),
            ],
          ),
        ),
        // appBar: AppBar(
        //   actions: [
        //     SizedBox(
        //       width: 50,
        //       height: 50,
        //       child: DecoratedBox(
        //         decoration: BoxDecoration(
        //           border: Border.all(
        //             color: AppColors.green,
        //             width: 2,
        //           ),
        //           borderRadius: BorderRadius.all(
        //             Radius.circular(100),
        //           ),
        //           image: panelProvider.employee.photo != null
        //               ? DecorationImage(
        //                   fit: BoxFit.cover,
        //                   image: NetworkImage(
        //                     ApiConstants.baseUrl + panelProvider.employee.photo!,
        //                   ),
        //                 )
        //               : null,
        //         ),
        //         child: panelProvider.employee.photo == null
        //             ? Center(
        //                 child: Text(
        //                   "${panelProvider.employee.firstName[0] + panelProvider.employee.lastName[0]}",
        //                   style: TextStyle(color: AppColors.black10),
        //                 ),
        //               )
        //             : null,
        //       ),
        //     ),
        //     const SizedBox(width: 10),
        //   ],
        //   backgroundColor: AppColors.white,
        //   centerTitle: true,
        //   title: Column(
        //     crossAxisAlignment: CrossAxisAlignment.end,
        //     children: [
        //       Text(
        //         "${panelProvider.employee.firstName} ${panelProvider.employee.lastName}",
        //         style: TextStyle(
        //           color: AppColors.black,
        //           fontSize: 16,
        //           fontWeight: FontWeight.w400,
        //         ),
        //       ),
        //       Text(
        //         panelProvider.employee.role.title ?? "",
        //         style: const TextStyle(
        //           color: AppColors.black10,
        //           fontSize: 14,
        //           fontWeight: FontWeight.w500,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),

        body: const TabBarView(
          children: [
            IncomingCallsPanel(),
            MissedCallsPanel(),
            CreatedTasksPanel(),
          ],
        ),

        // SizedBox(
        //   width: double.infinity,
        //   height: double.infinity,
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     children: [
        //       HeadersPanel1(),
        //       // BodyDetaylPanel(),
        //       BodyPageviewPanel(),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
