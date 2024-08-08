import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        SizedBox(
          height: 80,
          child: ListView(
            controller: panelProvider.scrollController,
            scrollDirection: Axis.horizontal,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    if (panelProvider.initialButtonIndex != 0) {
                      panelProvider.scrollToCenter(0, context);
                      panelProvider.changePage(0);
                      panelProvider.initialButtonIndex = 0;
                    }
                  },
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Входящие звонки',
                          style:
                              TextStyle(color: AppColors.black, fontSize: 16),
                        ),
                        Text(
                          'Звонков: ${panelProvider.conversations.length}',
                          style:
                              TextStyle(color: AppColors.black10, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: AppColors.green, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    if (panelProvider.initialButtonIndex != 1) {
                      panelProvider.scrollToCenter(1, context);
                      panelProvider.changePage(1);
                      panelProvider.initialButtonIndex = 1;
                    }
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Пропущенные звонки',
                        style: TextStyle(color: AppColors.black, fontSize: 16),
                      ),
                      Text(
                        'Звонков: ${panelProvider.missedCalls.length}',
                        style:
                            TextStyle(color: AppColors.black10, fontSize: 14),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: AppColors.red, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    if (panelProvider.initialButtonIndex != 2) {
                      panelProvider.scrollToCenter(2, context);
                      panelProvider.changePage(2);
                      panelProvider.initialButtonIndex = 2;
                    }
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Созданные задачи',
                        style: TextStyle(color: AppColors.black, fontSize: 16),
                      ),
                      const Text(
                        'Звонков: 0',
                        style:
                            TextStyle(color: AppColors.black10, fontSize: 14),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(color: AppColors.black10, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 500,
          child: PageView(
            controller: panelProvider.pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const IncomingCallsPanel(),
              const MissedCallsPanel(),
              const CreatedTasksPanel(),
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
    return SafeArea(
      child: ListView.builder(
        itemCount: panelProvider.conversations.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                color: AppColors.white,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        panelProvider.getFormattedDateTime(
                            panelProvider.conversations[index].startedAt),
                        style: TextStyle(
                          color: AppColors.black10,
                          fontSize: 14,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Неизвестный клиент',
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Icon(
                            CupertinoIcons.star_fill,
                            color: AppColors.orange,
                            size: 18,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            panelProvider.conversations[index].feedback.rating
                                .toString(),
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(
                            CupertinoIcons.phone_arrow_down_left,
                            color: AppColors.green,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'Принято',
                            style: TextStyle(
                              color: AppColors.black10,
                              fontSize: 14,
                            ),
                          ),
                          Spacer(),
                          Text(
                            panelProvider.getFormattedDateTime(panelProvider.conversations[index].duration, 'mm:ss'),
                            style: TextStyle(
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
    return ListView.builder(
      itemCount: panelProvider.missedCalls.length,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              color: AppColors.white,
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      panelProvider.getFormattedDateTime(
                          panelProvider.missedCalls[index].queuedAt),
                      style: TextStyle(
                        color: AppColors.black10,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'Неизвестный клиент',
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.phone_arrow_up_right,
                          color: AppColors.red,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Пропущен',
                          style: TextStyle(
                            color: AppColors.black10,
                            fontSize: 14,
                          ),
                        ),
                        Spacer(),
                        Text(
                          panelProvider.getFormattedDateTime(panelProvider.missedCalls[index].waitTime, 'mm:ss'),
                          style: TextStyle(
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
    return Center(
      child: Text('CreatedTasksPanel'),
    );
  }
}
