import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/styles/app_colors.dart';
import '../../../providers/control_panel_provider.dart';


class BodyDetaylPanel extends StatelessWidget {
  const BodyDetaylPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final panelProvider = Provider.of<ControlPanelProvider>(context);

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Divider(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                const Row(
                  children: [
                    Icon(
                      CupertinoIcons.person_alt_circle,
                      color: AppColors.black10,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'В очереди - ',
                      style: TextStyle(
                        color: AppColors.black10,
                        fontSize: 16,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '0',
                      style: TextStyle(
                        color: AppColors.black10,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(
                      CupertinoIcons.phone_arrow_down_left,
                      color: AppColors.green,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Принято - ',
                      style: TextStyle(
                        color: AppColors.black10,
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      panelProvider.performance?.calls.accepted.toString() ?? '0',
                      style: const TextStyle(
                        color: AppColors.black10,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(
                      CupertinoIcons.phone_arrow_up_right,
                      color: AppColors.red,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Пропущено - ',
                      style: TextStyle(
                        color: AppColors.black10,
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      panelProvider.performance?.calls.missed.toString() ?? '0',
                      style: const TextStyle(
                        color: AppColors.black10,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(
                      CupertinoIcons.star_fill,
                      color: AppColors.yellow,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Рейтинг - ',
                      style: TextStyle(
                        color: AppColors.black10,
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      panelProvider.performance?.averageRating.rating.toString() ?? '0',
                      style: const TextStyle(
                        color: AppColors.black10,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Divider(),
        ),
      ],
    );
  }
}
