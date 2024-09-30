import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbox_mobile/src/core/styles/app_svg.dart';
import 'package:qbox_mobile/src/features/pages/task/widget/footer.dart';
import 'package:qbox_mobile/src/features/pages/task/widget/item.dart';
import 'package:qbox_mobile/src/features/pages/task/widget/menu_bottom_sheet.dart';
import 'package:qbox_mobile/src/features/providers/task_provider.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({
    required this.id,
    super.key,
  });

  final int id;

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  void initState() {
    final provider = Provider.of<TaskProvider>(context, listen: false);
    provider.initialize(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task title'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // showModalBottomSheet(
              //   backgroundColor: AppColors.white,
              //   context: context,
              //   builder: (context) => const MenuBottomSheet(),
              // );

              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                isDismissible: true,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return const MenuBottomSheet(); // MenuBottomSheet ni ko'rsatamiz
                },
              );
            },
            icon: const Icon(Icons.more_vert_sharp),
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Item(
                icon: AppSvg.userCard,
                title: 'ID',
                value: '180924-000-005',
              ),
              Item(
                icon: AppSvg.earth,
                title: 'Source',
                value: 'Telephony',
              ),
              Item(
                icon: AppSvg.userCard,
                title: 'Name',
                value: 'Jahongir',
              ),
              Item(
                icon: AppSvg.folder,
                title: 'Project',
                value: '🔑 Регистрация в МФЦА',
              ),
              Item(
                icon: AppSvg.list,
                title: 'Form',
                value: '🔑 Регистрация в МФЦА',
              ),
              Item(
                icon: AppSvg.author,
                title: 'Author',
                value: 'Jahongir Rahmanshikov',
              ),
              Item(
                icon: AppSvg.calendar,
                title: 'Date',
                value: '18 Sep 2024, 17:17',
              ),
              Item(
                icon: AppSvg.time,
                title: 'Time',
                value: '18 Sep 2024, 17:47',
              ),
              Item(
                icon: AppSvg.handWatch,
                title: 'Deadline',
                value: 'Not specified',
              ),
              Item(
                icon: AppSvg.shoppingCart,
                title: 'Main task',
                value: 'Not specified',
              ),
              Item(
                icon: AppSvg.flag,
                title: 'Priority',
                value: 'Not Selected',
              ),
              Item(
                icon: AppSvg.bolt,
                title: 'Type',
                value: 'Not Selected',
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: const Footer(),
    );
  }
}
