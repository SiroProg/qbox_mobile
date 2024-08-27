// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:qbox_mobile/src/features/pages/home_screen/widget/custom_app_bar.dart';
// import 'package:qbox_mobile/src/features/pages/home_screen/widget/custom_bottom_navigation.dart';
// import 'package:qbox_mobile/src/features/providers/home_provider.dart';
// import 'package:qbox_mobile/src/features/services/socket_service.dart';

// class HomeControl extends StatefulWidget {
//   const HomeControl({super.key});

//   @override
//   State<HomeControl> createState() => _HomeControlState();
// }

// class _HomeControlState extends State<HomeControl> {
//   @override
//   void initState() {
//     super.initState();
//     socketService.initSocket(context);
//   }

//   @override
//   void dispose() {
//     socketService.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) => Consumer<HomeProvider>(
//         builder: (context, provider, child) => Scaffold(
//           appBar: CustomAppBar(provider: provider),
//           body: provider.pages[provider.selectedIndex],
//           bottomNavigationBar: const CustomBottomNavigation(),
//         ),
//       );
// }
