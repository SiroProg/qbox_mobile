import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_images.dart';
import '../../providers/auth_provider.dart';
import 'widgets/footer_widget.dart';
import 'widgets/header_widget.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage(AppImages.backgroungImage),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: ColoredBox(
              color: AppColors.black30.withOpacity(0.2),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                HeaderWidget(),
                FooterWidget(),
              ],
            ),
          ),
          Positioned(
            top:10,
            right: 30,
            child: SafeArea(
              child: PopupMenuButton<String>(
                color: AppColors.white,
                icon: Row(
                  children: [
                    Text(
                      viewModel.selectedLanguage,
                      style: TextStyle(color: AppColors.white),
                    ),
                    Icon(Icons.arrow_drop_down, color: AppColors.white),
                  ],
                ),
                initialValue: viewModel.selectedLanguage,
                onSelected: (value) {
                  viewModel.updateLanguage(value);
                },
                itemBuilder: (context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'Каз',
                    child: Text('Каз'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Рус',
                    child: Text('Рус'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Eng',
                    child: Text('Eng'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
