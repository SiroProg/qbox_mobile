import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbox_mobile/src/core/styles/app_colors.dart';
import 'package:qbox_mobile/src/features/pages/task/widget/status_bottom_sheet.dart';
import 'package:qbox_mobile/src/features/providers/task_provider.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (
        BuildContext context,
        TaskProvider provider,
        Widget? child,
      ) =>
          Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      isDismissible: true,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return const StatusBottomSheet();
                      },
                    );
                  },
                  child: SizedBox(
                    width: 300,
                    height: 50,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.blue),
                        color: Colors.blue[100]!,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Status',
                              style: TextStyle(color: AppColors.grey),
                            ),
                            Text(
                              provider.sellectedStatus ?? 'Sellect',
                              style: const TextStyle(fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 53,
                  width: 56,
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    border: Border.all(color: Colors.blue[100]!, width: 1),
                  ),
                  child: IconButton(
                    icon: const Badge(
                      smallSize: 8,
                      child:
                          Icon(CupertinoIcons.chat_bubble, color: Colors.blue),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
