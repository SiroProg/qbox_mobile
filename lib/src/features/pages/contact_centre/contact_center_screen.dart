import 'package:flutter/material.dart';
import 'package:qbox_mobile/src/features/pages/calls/calls_screen.dart';
import 'package:qbox_mobile/src/features/pages/home_screen/widget/custom_app_bar.dart';
import 'package:qbox_mobile/src/features/pages/home_screen/widget/custom_bottom_navigation.dart';
import 'package:qbox_mobile/src/features/pages/home_screen/widget/custom_list_tile.dart';

class ContactCenterScreen extends StatefulWidget {
  const ContactCenterScreen({super.key});

  @override
  State<ContactCenterScreen> createState() => _ContactCenterScreenState();
}

class _ContactCenterScreenState extends State<ContactCenterScreen> {
  final List<Map<String, Object?>> items = [
    {'icon': Icons.headset, 'title': 'Calls'},
    {'icon': Icons.code_outlined, 'title': 'Forms'},
    {'icon': Icons.lightbulb_outline_sharp, 'title': 'Knowledge base'},
    {'icon': Icons.view_comfortable_rounded, 'title': 'Chat Bot'},
    {'icon': Icons.sentiment_satisfied_outlined, 'title': 'Tech Support'},
    {'icon': Icons.folder_copy_rounded, 'title': 'Reports'},
  ];

  late Map<String, VoidCallback> actions;

  @override
  void initState() {
    super.initState();
    actions = {
      'Calls': () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CallsScreen(),
          ),
        );
      },
      'Forms': () {},
      'Knowledge base': () {},
      'Chat Bot': () {},
      'Tech Support': () {},
      'Reports': () {},
    };
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const CustomAppBar(),
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
        bottomNavigationBar: const CustomBottomNavigation(),
      );
}
