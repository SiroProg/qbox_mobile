import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:qbox_mobile/src/core/styles/app_colors.dart';
import 'package:qbox_mobile/src/core/styles/app_svg.dart';
import 'package:qbox_mobile/src/features/pages/search/widgets/custom_card.dart';
import 'package:qbox_mobile/src/features/pages/task/task_screen.dart';
import 'package:qbox_mobile/src/features/providers/serach_provider.dart';

class TaskScreenItem extends StatelessWidget {
  const TaskScreenItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SerachProvider>(
      builder: (
        BuildContext context,
        SerachProvider provider,
        Widget? child,
      ) {
        if (provider.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.blue,
            ),
          );
        }

        if (provider.tasks.isEmpty) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.string(
                  AppSvg.empty,
                  width: 120,
                  height: 120,
                ),
                const Text('Ничего не найдено'),
              ],
            ),
          );
        }

        return ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: provider.tasks.length,
          itemBuilder: (context, index) => CustomCard(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      TaskScreen(id: provider.tasks[index].id),
                ),
              );
            },
            photo: provider.tasks[index].photo,
            title: provider.tasks[index].title,
            subtile: provider.tasks[index].trackId,
          ),
        );
      },
    );
  }
}
