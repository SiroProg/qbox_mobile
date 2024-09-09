import 'package:qbox_mobile/src/features/pages/home_screen/home_control.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../providers/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: SignInForm(),
    );
  }
}

class SignInForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Form(
      key: _formKey,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Войти в панель управления",
              style: TextStyle(
                color: AppColors.white,
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: TextFormField(
                  onChanged: (value) {
                    authProvider.updateLogin(value);
                    _formKey.currentState!.validate();
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      CupertinoIcons.person,
                      color: AppColors.black10,
                    ),
                    hintText: 'Логин',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: TextFormField(
                  onChanged: (value) {
                    authProvider.updatePassword(value);
                    _formKey.currentState!.validate();
                  },
                  obscureText: !authProvider.isPasswordVisible,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      CupertinoIcons.shield,
                      color: AppColors.black10,
                    ),
                    suffixIcon: IconButton(
                      onPressed: authProvider.togglePasswordVisibility,
                      icon: Icon(
                        authProvider.isPasswordVisible
                            ? CupertinoIcons.eye
                            : CupertinoIcons.eye_slash,
                        color: AppColors.black10,
                      ),
                    ),
                    hintText: 'Пароль',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: CupertinoButton(
                color: AppColors.blue,
                onPressed: authProvider.canSignIn
                    ? () async {
                        final responseData = await authProvider.signIn();
                        if (responseData == null ||
                            !(responseData["_success"] ?? false)) {
                          showCupertinoDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CupertinoAlertDialog(
                                title: const Text('Ошибка входа'),
                                content: Text(
                                  responseData?["error"]["message"] ??
                                      'Произошла ошибка при входе.',
                                  style: const TextStyle(
                                    color: AppColors.black,
                                  ),
                                ),
                                actions: <Widget>[
                                  CupertinoDialogAction(
                                    child: const Text('OK'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          print(responseData);
                          authProvider.setToken(responseData["token"]);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeControl(),
                            ),
                          );
                        }
                      }
                    : null,
                child: const Text(
                  "Войти",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
