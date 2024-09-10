import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/styles/app_colors.dart';
import '../../../providers/control_panel_provider.dart';

class BodyDetaylPanel extends StatelessWidget {
  const BodyDetaylPanel({super.key});
  @override
  Widget build(BuildContext context) {
    final panelProvider = Provider.of<ControlPanelProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SizedBox(
        height: 40,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            //   child: SizedBox(
            //     width: double.infinity,
            //     child: Column(
            //       children: [
            //         Row(
            //           children: [
            //             SvgPicture.string(
            //               AppSvg.user,
            //             ),
            //             SizedBox(width: 10),
            //             Text(
            //               'В очереди - ',
            //               style: TextStyle(
            //                 color: AppColors.black10,
            //                 fontSize: 16,
            //               ),
            //             ),
            //             Spacer(),
            //             Text(
            //               '0',
            //               style: TextStyle(
            //                 color: AppColors.black10,
            //                 fontSize: 16,
            //                 fontWeight: FontWeight.bold,
            //               ),
            //             ),
            //           ],
            //         ),
            //         const SizedBox(height: 10),
            //         Row(
            //           children: [
            //             SvgPicture.string(
            //               AppSvg.incomingCall,
            //             ),
            //             const SizedBox(width: 10),
            //             const Text(
            //               'Принято - ',
            //               style: TextStyle(
            //                 color: AppColors.black10,
            //                 fontSize: 16,
            //               ),
            //             ),
            //             const Spacer(),
            //             Text(
            //               panelProvider.performance?.calls.accepted.toString() ??
            //                   '0',
            //               style: const TextStyle(
            //                 color: AppColors.black10,
            //                 fontSize: 16,
            //                 fontWeight: FontWeight.bold,
            //               ),
            //             ),
            //           ],
            //         ),
            //         const SizedBox(height: 10),
            //         Row(
            //           children: [
            //             SvgPicture.string(
            //               AppSvg.outgoingCall,
            //             ),
            //             const SizedBox(width: 10),
            //             const Text(
            //               'Пропущено - ',
            //               style: TextStyle(
            //                 color: AppColors.black10,
            //                 fontSize: 16,
            //               ),
            //             ),
            //             const Spacer(),
            //             Text(
            //               panelProvider.performance?.calls.missed.toString() ?? '0',
            //               style: const TextStyle(
            //                 color: AppColors.black10,
            //                 fontSize: 16,
            //                 fontWeight: FontWeight.bold,
            //               ),
            //             ),
            //           ],
            //         ),
            //         const SizedBox(height: 10),
            //         Row(
            //           children: [
            //             SvgPicture.string(AppSvg.star),
            //             const SizedBox(width: 10),
            //             const Text(
            //               'Рейтинг - ',
            //               style: TextStyle(
            //                 color: AppColors.black10,
            //                 fontSize: 16,
            //               ),
            //             ),
            //             const Spacer(),
            //             Text(
            //               panelProvider.performance?.averageRating.rating
            //                       .toString() ??
            //                   '0',
            //               style: const TextStyle(
            //                 color: AppColors.black10,
            //                 fontSize: 16,
            //                 fontWeight: FontWeight.bold,
            //               ),
            //             ),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  panelProvider.setInitialButtonIndex(0, context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.white,
                  shape: ContinuousRectangleBorder(
                    side: BorderSide(
                      color: panelProvider.initialButtonIndex == 0
                          ? AppColors.green
                          : AppColors.black10,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Входящие',
                    style: TextStyle(
                      color: AppColors.black,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 5),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  panelProvider.setInitialButtonIndex(1, context);
                },
                style: ElevatedButton.styleFrom(
                  side: BorderSide(
                    color: panelProvider.initialButtonIndex == 1
                        ? AppColors.green
                        : AppColors.black10,
                  ),
                  backgroundColor: AppColors.white,
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Пропущенные',
                    style: TextStyle(
                      color: AppColors.black,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 5),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  panelProvider.setInitialButtonIndex(2, context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.white,
                  side: BorderSide(
                    color: panelProvider.initialButtonIndex == 2
                        ? AppColors.green
                        : AppColors.black10,
                  ),
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Задачи',
                    style: TextStyle(
                      color: AppColors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
