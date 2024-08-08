import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../features/pages/authentication_screen/authentication_page.dart';
import '../../features/providers/auth_provider.dart';
import '../../features/providers/control_panel_provider.dart';
import '../../features/providers/profile_provider.dart';
import '../styles/app_colors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
        ChangeNotifierProvider(create: (_) => ControlPanelProvider()),
      ],
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        title: 'Task 1',
        theme: ThemeData(
          primaryColor: AppColors.blue,
          fontFamily: 'Oxygen',
        ),
        home: const AuthenticationPage(),
      ),
    );
  }
}
