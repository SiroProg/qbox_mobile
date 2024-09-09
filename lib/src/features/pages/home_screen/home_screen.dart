import 'package:flutter/material.dart';
import 'package:qbox_mobile/src/features/pages/contact_centre/contact_center_screen.dart';
import 'package:qbox_mobile/src/features/pages/home_screen/widget/custom_list_tile.dart';
import 'package:qbox_mobile/src/features/services/socket_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final Map<String, VoidCallback> actions;

  @override
  void initState() {
    super.initState();
    actions = {
      'Contact Center': () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ContactCenterScreen(),
          ),
        );
      },
      'Tickets': () {
        // print('Navigating to Tickets');
        // Handle Tickets action
      },
      'Sales': () {},
      'Marketing': () {
        // print('Navigating to Marketing');
        // Handle Marketing action
      },
      'Integration': () {
        // print('Navigating to Integration');
        // Handle Integration action
      },
      'Management': () {
        // print('Navigating to Management');
        // Handle Management action
      },
      'Disk': () {
        // print('Navigating to Disk');
        // Handle Disk action
      },
      'To Do': () {
        // print('Navigating to To Do');
        // Handle To Do action
      },
      'Analytics': () {
        // print('Navigating to Analytics');
        // Handle Analytics action
      },
      'HR-WFM': () {
        // print('Navigating to HR-WFM');
        // Handle HR-WFM action
      },
      'Video conference': () {
        // print('Navigating to Video conference');
        // Handle Video conference action
      },
    };
  }

  @override
  void dispose() {
    socketService.dispose();
    super.dispose();
  }

  final List<Map<String, Object>> items = [
    {
      'icon': Icons.headset,
      'title': 'Contact Center',
      'subtitle': 'Calls, chatbots, knowledge base'
    },
    {
      'icon': Icons.markunread_sharp,
      'title': 'Tickets',
      'subtitle': 'Managing and tracking tasks and customer requests'
    },
    {
      'icon': Icons.rocket_launch,
      'title': 'Sales',
      'subtitle': 'Lead processing, sales funnel, closing deals'
    },
    {
      'icon': Icons.mark_email_read,
      'title': 'Marketing',
      'subtitle': 'Mailing lists, surveys, scanning of social networks'
    },
    {
      'icon': Icons.arrow_outward_outlined,
      'title': 'Integration',
      'subtitle': 'Integration with other platforms and services'
    },
    {
      'icon': Icons.manage_accounts_rounded,
      'title': 'Management',
      'subtitle': 'Account management, logs, access'
    },
    {
      'icon': Icons.folder_copy,
      'title': 'Disk',
      'subtitle': 'Cloud storage of electronic documents'
    },
    {
      'icon': Icons.checklist,
      'title': 'To Do',
      'subtitle': 'Planning and management of priority tasks'
    },
    {
      'icon': Icons.analytics,
      'title': 'Analytics',
      'subtitle': 'Data Collection and Analysis Center'
    },
    {
      'icon': Icons.browse_gallery_rounded,
      'title': 'HR-WFM',
      'subtitle': 'Управление рабочими процессами и ресурсами'
    },
    {
      'icon': Icons.video_call,
      'title': 'Video conference',
      'subtitle': 'Planning and conducting video conferences'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 3 / 1.5,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return CustomListTile(
            icon: item['icon'] as IconData,
            title: item['title'] as String,
            subtitle: item['subtitle'] as String,
            onTap: () {
              final action = actions[item['title'] as String];
              if (action != null) action();
            },
          );
        },
      ),
    );
  }
}
