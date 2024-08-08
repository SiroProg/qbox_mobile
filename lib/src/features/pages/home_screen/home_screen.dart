import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/models/auth_models/employee_model.dart';
import '../../../core/styles/app_colors.dart';
import '../../providers/auth_provider.dart';
import '../../services/db_service/db_service.dart';
import '../../services/home_service/home_service.dart';
import '../../services/socket_service.dart';
import '../control_panel_screen/control_panel_screen.dart';
import '../profile_screen/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Employee _employeeFuture;

  @override
  void initState() {
    super.initState();
    _loadEmployee();
    SocketService.initSocket();
  }

  void _loadEmployee() async {
    String token = DBService.token;
    HomeService apiService = HomeService();
    _employeeFuture = await apiService.fetchEmployee(token);
    DBService.id = _employeeFuture.id;
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.black,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoButton(
              onPressed: () {
                authProvider.user = _employeeFuture;
                _loadEmployee();
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => ProfileScreen(id: _employeeFuture.id),
                  ),
                );
              },
              color: AppColors.white,
              child: const Text(
                "Profile",
                style: TextStyle(
                  color: AppColors.black,
                ),
              ),
            ),
            const SizedBox(height: 20),
            CupertinoButton(
              onPressed: () {
                authProvider.user = _employeeFuture;
                _loadEmployee();
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => VideoScreen(
                      employee: _employeeFuture,
                    ),
                  ),
                );
              },
              color: AppColors.white,
              child: const Text(
                "Socket",
                style: TextStyle(
                  color: AppColors.black,
                ),
              ),
            ),
            const SizedBox(height: 20),
            CupertinoButton(
              onPressed: () {
                DBService.token = 'b72e2d8666d64bc188b65ab53ec7e5a3';
              },
              color: AppColors.white,
              child: const Text(
                "New token",
                style: TextStyle(
                  color: AppColors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
