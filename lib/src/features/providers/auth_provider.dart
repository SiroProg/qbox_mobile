import 'package:flutter/material.dart';

import '../../core/models/auth_models/employee_model.dart';
import '../services/auth_service/auth_service.dart';
import '../services/db_service/db_service.dart';


class AuthProvider extends ChangeNotifier {
  late Employee user;
  String login = 'sirozhiddin_nuriddinov';
  String password = 'devsirozh2006';
  String email = '';
  bool canResetPassword = false;
  bool isPasswordVisible = false;
  bool canSignIn = true;
  bool isRegister = true;
  String selectedLanguage = "Рус";

  void setToken(String token) => DBService.token = token;

  void toggleRegister() {
    isRegister = !isRegister;
    notifyListeners();
  }

  void updateLanguage(String language) {
    selectedLanguage = language;
    notifyListeners();
  }

  void updateLogin(String value) {
    login = value;
    _validateInputs();
  }

  void updatePassword(String value) {
    password = value;
    _validateInputs();
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  void _validateInputs() {
    canSignIn = login.isNotEmpty && password.isNotEmpty;
    notifyListeners();
  }

  Future<Map<String, dynamic>?> signIn() async {
    return await AuthService.postLogin(login, password);
  }

  void updateEmail(String value) {
    email = value;
    _validateEmail();
  }

  void _validateEmail() {
    canResetPassword = email.isNotEmpty;
    notifyListeners();
  }

  Future<String?> resetPassword() async {
    return await AuthService.resetPassword(email);
  }
}
