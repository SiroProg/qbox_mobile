import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qbox_mobile/src/features/pages/control_panel_screen/control_panel_screen.dart';
import 'package:qbox_mobile/src/features/pages/employess/employees_screen.dart';
import 'package:qbox_mobile/src/features/pages/home_screen/widget/custom_list_tile.dart';
import 'package:qbox_mobile/src/features/services/db_service/db_service.dart';
import 'package:qbox_mobile/src/features/services/home_service/home_service.dart';

class CallsScreen extends StatefulWidget {
  const CallsScreen({super.key});

  @override
  State<CallsScreen> createState() => _CallsScreenState();
}

class _CallsScreenState extends State<CallsScreen> {
  final List<Map<String, Object?>> items = [
    {'icon': Icons.headset, 'title': "Operator's Workplace"},
    {'icon': Icons.favorite_outline_sharp, 'title': 'Live chat'},
    {'icon': Icons.favorite_outline_sharp, 'title': 'Live chat 2.0'},
    {'icon': Icons.new_label_outlined, 'title': 'Domains'},
    {'icon': Icons.filter_alt, 'title': 'Queues'},
    {'icon': Icons.move_up_rounded, 'title': 'Outgoing call'},
    {'icon': Icons.phone, 'title': 'Telephony'},
    {'icon': Icons.change_circle_rounded, 'title': 'Post-processing'},
    {'icon': Icons.book, 'title': 'Adress book'},
    {'icon': Icons.supervised_user_circle_sharp, 'title': 'Black list'},
    {'icon': Icons.question_answer, 'title': 'Quick answers'},
  ];

  late Map<String, VoidCallback> actions;

  @override
  void initState() {
    super.initState();
    actions = {
      "Operator's Workplace": () async {
        final employee = await HomeService.fetchEmployee(DBService.token);
        if (mounted) {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => VideoScreen(
                employee: employee,
              ),
            ),
          );
        }
      },
      'Live chat': () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const EmployeesScreen(),
          ),
        );
      },
      'Live chat 2.0': () {},
      'Domains': () {},
      'Queues': () {},
      'Outgoing call': () {},
      'Telephony': () {},
      'Post-processing': () {},
      'Adress book': () {},
      'Black list': () {},
      'Quick answers': () {},
    };
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: 13.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 3 / 0.5,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return CustomListTile(
                icon: item['icon'] as IconData,
                title: item['title'] as String,
                subtitle: null,
                onTap: () {
                  final action = actions[item['title'] as String];
                  if (action != null) action();
                },
              );
            },
          ),
        ),
      );
}
