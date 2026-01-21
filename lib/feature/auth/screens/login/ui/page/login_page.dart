import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/core/constant/app_color.dart';
import 'package:shop_app/core/di/injection.dart';
import 'package:shop_app/feature/auth/screens/login/provider/login_provider.dart';
import 'package:shop_app/feature/auth/screens/login/ui/template/login_template.dart';

@RoutePage()
class LoginScreen extends StatelessWidget implements AutoRouteWrapper {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    log('Login page build called');
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: AppColor.bgColor,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        child: LoginTemplate(
            usernameController: usernameController,
            passwordController: passwordController),
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return ChangeNotifierProvider<LoginProvider>(
      create: (_) => LoginProvider(sl.get()),
      child: this,
    );
  }
}
