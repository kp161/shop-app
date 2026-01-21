import 'package:flutter/material.dart';
import 'package:shop_app/feature/auth/screens/login/ui/form/login_form.dart';

class LoginTemplate extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  const LoginTemplate(
      {super.key,
      required this.usernameController,
      required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return LoginForm(
        usernameController: usernameController,
        passwordController: passwordController);
  }
}
