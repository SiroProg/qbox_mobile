import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../providers/auth_provider.dart';
import 'sign_in.dart';
import 'sign_up.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: const FooterView(),
    );
  }
}

class FooterView extends StatelessWidget {
  const FooterView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AuthProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              viewModel.isRegister ? const SignIn() : const SignUp(),
              GestureDetector(
                onTap: () {
                  viewModel.toggleRegister();
                },
                child: Text(
                  viewModel.isRegister ? "Сбросить пароль" : "Войти",
                  style: const TextStyle(
                    color: AppColors.blue,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
