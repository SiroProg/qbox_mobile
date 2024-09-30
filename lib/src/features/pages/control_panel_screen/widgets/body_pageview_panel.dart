import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:qbox_mobile/src/core/styles/app_svg.dart';

import '../../../../core/styles/app_colors.dart';
import '../../../providers/control_panel_provider.dart';

class BodyPageviewPanel extends StatefulWidget {
  const BodyPageviewPanel({super.key});

  @override
  State<BodyPageviewPanel> createState() => _BodyPageviewPanelState();
}

class _BodyPageviewPanelState extends State<BodyPageviewPanel> {
  @override
  Widget build(BuildContext context) {
    final panelProvider = Provider.of<ControlPanelProvider>(context);
    return Column(
      children: [
        // SizedBox(
        //   height: 80,
        //   child: ListView(
        //     controller: panelProvider.scrollController,
        //     scrollDirection: Axis.horizontal,
        //     children: [
        //       Padding(
        //         padding:
        //             const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        //         child: ElevatedButton(
        //           onPressed: () {
        //             if (panelProvider.initialButtonIndex != 0) {
        //               panelProvider.scrollToCenter(0, context);
        //               panelProvider.changePage(0);
        //               panelProvider.initialButtonIndex = 0;
        //             }
        //           },
        //           style: ElevatedButton.styleFrom(
        //             backgroundColor: AppColors.white,
        //             shape: RoundedRectangleBorder(
        //               side: const BorderSide(color: AppColors.green, width: 1),
        //               borderRadius: BorderRadius.circular(10),
        //             ),
        //           ),
        //           child: Center(
        //             child: Column(
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               children: [
        //                 const Text(
        //                   'Входящие звонки',
        //                   style:
        //                       TextStyle(color: AppColors.black, fontSize: 16),
        //                 ),
        //                 Text(
        //                   'Звонков: ${panelProvider.conversations.length}',
        //                   style: const TextStyle(
        //                       color: AppColors.black10, fontSize: 14),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //       ),
        //       Padding(
        //         padding:
        //             const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        //         child: ElevatedButton(
        //           onPressed: () {
        //             if (panelProvider.initialButtonIndex != 1) {
        //               panelProvider.scrollToCenter(1, context);
        //               panelProvider.changePage(1);
        //               panelProvider.initialButtonIndex = 1;
        //             }
        //           },
        //           style: ElevatedButton.styleFrom(
        //             backgroundColor: AppColors.white,
        //             shape: RoundedRectangleBorder(
        //               side: const BorderSide(color: AppColors.red, width: 1),
        //               borderRadius: BorderRadius.circular(10),
        //             ),
        //           ),
        //           child: Column(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               const Text(
        //                 'Пропущенные звонки',
        //                 style: TextStyle(color: AppColors.black, fontSize: 16),
        //               ),
        //               Text(
        //                 'Звонков: ${panelProvider.missedCalls.length}',
        //                 style: const TextStyle(
        //                     color: AppColors.black10, fontSize: 14),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //       Padding(
        //         padding:
        //             const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        //         child: ElevatedButton(
        //           onPressed: () {
        //             if (panelProvider.initialButtonIndex != 2) {
        //               panelProvider.scrollToCenter(2, context);
        //               panelProvider.changePage(2);
        //               panelProvider.initialButtonIndex = 2;
        //             }
        //           },
        //           style: ElevatedButton.styleFrom(
        //             backgroundColor: AppColors.white,
        //             shape: RoundedRectangleBorder(
        //               side:
        //                   const BorderSide(color: AppColors.black10, width: 1),
        //               borderRadius: BorderRadius.circular(10),
        //             ),
        //           ),
        //           child: const Column(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               Text(
        //                 'Созданные задачи',
        //                 style: TextStyle(color: AppColors.black, fontSize: 16),
        //               ),
        //               Text(
        //                 'Звонков: 0',
        //                 style:
        //                     TextStyle(color: AppColors.black10, fontSize: 14),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),

        SizedBox(
          height: 500,
          child: PageView(
            controller: panelProvider.pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              IncomingCallsPanel(),
              MissedCallsPanel(),
              CreatedTasksPanel(),
            ],
          ),
        ),
      ],
    );
  }
}

class IncomingCallsPanel extends StatelessWidget {
  const IncomingCallsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final panelProvider = Provider.of<ControlPanelProvider>(context);
    return panelProvider.conversations.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Входящих звонков нет'),
              ],
            ),
          )
        : SafeArea(
            child: ListView.builder(
              itemCount: panelProvider.conversations.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Card(
                      color: AppColors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              panelProvider.getFormattedDateTime(
                                panelProvider.conversations[index].startedAt,
                              ),
                              style: const TextStyle(
                                color: AppColors.black10,
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Неизвестный клиент',
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                SvgPicture.string(
                                  AppSvg.star,
                                  width: 16,
                                  height: 16,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  panelProvider
                                      .conversations[index].feedback.rating
                                      .toString(),
                                  style: const TextStyle(
                                    color: AppColors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                SvgPicture.string(
                                  AppSvg.incomingCall,
                                  width: 19,
                                  height: 19,
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  'Принято',
                                  style: TextStyle(
                                    color: AppColors.black10,
                                    fontSize: 14,
                                  ),
                                ),
                                const Spacer(),
                                SvgPicture.string(
                                  AppSvg.clock,
                                  width: 18,
                                  height: 18,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  panelProvider.getFormattedDateTime(
                                      panelProvider
                                          .conversations[index].duration,
                                      'mm:ss'),
                                  style: const TextStyle(
                                    color: AppColors.black10,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
  }
}

class MissedCallsPanel extends StatelessWidget {
  const MissedCallsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final panelProvider = Provider.of<ControlPanelProvider>(context);
    return panelProvider.missedCalls.isEmpty
        ? const SizedBox(
            height: 100,
            child: Center(
              child: Text('Пропущенных звонков нет'),
            ),
          )
        : ListView.builder(
            itemCount: panelProvider.missedCalls.length,
            itemBuilder: (context, index) {
              return SizedBox(
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    color: AppColors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            panelProvider.getFormattedDateTime(
                                panelProvider.missedCalls[index].queuedAt),
                            style: const TextStyle(
                              color: AppColors.black10,
                              fontSize: 14,
                            ),
                          ),
                          const Text(
                            'Неизвестный клиент',
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              SvgPicture.string(AppSvg.outgoingCall,
                                  width: 18, height: 18),
                              const SizedBox(width: 10),
                              const Text(
                                'Пропущен',
                                style: TextStyle(
                                  color: AppColors.black10,
                                  fontSize: 14,
                                ),
                              ),
                              const Spacer(),
                              SvgPicture.string(AppSvg.clock,
                                  width: 18, height: 18),
                              const SizedBox(width: 10),
                              Text(
                                panelProvider.getFormattedDateTime(
                                    panelProvider.missedCalls[index].waitTime,
                                    'mm:ss'),
                                style: const TextStyle(
                                  color: AppColors.black10,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
  }
}

class CreatedTasksPanel extends StatelessWidget {
  const CreatedTasksPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final panelProvider = Provider.of<ControlPanelProvider>(context);
    return (panelProvider.taskModel?.data?.tickets!.isEmpty ?? true)
        ? Center(
            child: Text('Созданных задач нет'),
          )
        : SafeArea(
            child: ListView.builder(
              itemCount: panelProvider.taskModel?.data?.tickets?.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Card(
                      color: AppColors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  panelProvider.getFormattedDateTime(
                                    panelProvider.taskModel!.data!
                                        .tickets![index].datetime!
                                        .toInt(),
                                  ),
                                  style: TextStyle(
                                    color: AppColors.black10,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Text(panelProvider
                                    .taskModel?.data!.tickets![index].title ??
                                ''),
                            SizedBox(
                              width: 100,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  border: Border.all(
                                    color: AppColors.black10,
                                    width: 0.5,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.string(AppSvg.sheduled)
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
  }
}
