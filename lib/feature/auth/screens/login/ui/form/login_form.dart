import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/core/constant/app_color.dart';
import 'package:shop_app/core/routes/app_router.dart';
import 'package:shop_app/core/utils/dimensions.dart';
import 'package:shop_app/core/utils/preference_utils.dart';
import 'package:shop_app/core/utils/show_snackbar.dart';
import 'package:shop_app/core/validation/app_validation.dart';
import 'package:shop_app/feature/auth/screens/login/provider/login_provider.dart';
import 'package:shop_app/widgets/app_logo.dart';
import 'package:shop_app/widgets/text_field.dart';

class LoginForm extends StatefulWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  const LoginForm(
      {super.key,
      required this.usernameController,
      required this.passwordController});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    log('Login form build called');
    final email = getString('email');
    final accessToken = getString('token');
    log('AccessToken: $accessToken, Email: $email');

    return SafeArea(
        child: Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppLogo.large(),
                  const SizedBox(height: 1),
                  const Text(
                    'ShopEase',
                    style: TextStyle(
                      color: AppColor.primaryColor,
                      fontSize: Dimensions.fontSize22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 100),
                  CustomeTextField(
                    controller: widget.usernameController,
                    labelText: "Username",
                    hintText: "Enter Your Username",
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: Dimensions.fontSizeSmall,
                    ),
                    focusedBorderColor: AppColor.primaryColor,
                    enabledBorderColor: AppColor.bgColor,
                    disabledBorderColor: Colors.grey,
                    borderWidth: 1.5,
                    borderRadius: BorderRadius.circular(30),
                    prefixIcon: const Icon(Icons.person_outline),
                    validator: AppValidation.validateUsername,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(height: 30),
                  CustomeTextField(
                    controller: widget.passwordController,
                    labelText: "Password",
                    hintText: "Enter Your Password",
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: Dimensions.fontSizeSmall,
                    ),
                    focusedBorderColor: AppColor.primaryColor,
                    enabledBorderColor: AppColor.bgColor,
                    disabledBorderColor: Colors.grey,
                    borderWidth: 1.5,
                    borderRadius: BorderRadius.circular(30),
                    isObscure: _isObscure,
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                        icon: Icon(_isObscure
                            ? Icons.visibility_off
                            : Icons.visibility)),
                    validator: AppValidation.validateLoginPassword,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
        Consumer<LoginProvider>(
          builder: (context, provider, _) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
                vertical: 16,
              ),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    final loginProvider = context.read<LoginProvider>();

                    if (loginProvider.isLoading) return;

                    if (_formKey.currentState!.validate()) {
                      final success = await loginProvider.login(
                        widget.usernameController.text.trim(),
                        widget.passwordController.text.trim(),
                      );

                      if (success) {
                        showFlushbar(
                          context: context,
                          message: "Login Successful!",
                          isError: false,
                        );

                        /// WAIT 400ms so snackbar appears smoothly
                        await Future.delayed(const Duration(milliseconds: 400));

                        /// Navigate to Products Screen
                        context.router.root.replace(const GetAllProductRoute());
                      } else {
                        showFlushbar(
                          context: context,
                          message: "Invalid username or password",
                          isError: true,
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: context.watch<LoginProvider>().isLoading
                      ? const SizedBox(
                          height: 25,
                          width: 25,
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                            color: AppColor.textColor,
                          ),
                        )
                      : const Text(
                          'Login',
                          style: TextStyle(
                            color: AppColor.textColor,
                            fontSize: Dimensions.fontSize20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),
              ),
            );
          },
        ),
      ],
    ));
  }
}
