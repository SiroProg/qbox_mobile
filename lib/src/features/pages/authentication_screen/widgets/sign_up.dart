import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/styles/app_colors.dart';
import '../../../providers/auth_provider.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: SignUpForm(),
    );
  }
}

class SignUpForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final resetPasswordProvider = Provider.of<AuthProvider>(context);

    return Form(
      key: _formKey,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Сброс пароля",
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
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: TextFormField(
                  onChanged: (value) {
                    resetPasswordProvider.updateEmail(value);
                    _formKey.currentState!.validate();
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      CupertinoIcons.person,
                      color: AppColors.black10,
                    ),
                    hintText: 'Логин',
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: CupertinoButton(
                color: resetPasswordProvider.canResetPassword
                    ? AppColors.blue
                    : AppColors.red,
                onPressed: resetPasswordProvider.canResetPassword
                    ? () async {
                        final responseData =
                            await resetPasswordProvider.resetPassword();
                        if (responseData == null) {
                          showCupertinoDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CupertinoAlertDialog(
                                title: const Text('Сброс пароля'),
                                content: const Text(
                                  "На почту, указанную в профиле, отправлена ссылка для сброса пароля",
                                  style: TextStyle(
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
                          showCupertinoDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CupertinoAlertDialog(
                                title: const Text('Ошибка'),
                                content: Text(
                                  responseData,
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
                        }
                      }
                    : null,
                child: const Text(
                  "Сбросить пароль",
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
