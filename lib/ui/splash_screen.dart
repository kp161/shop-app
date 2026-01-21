import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/core/constant/app_color.dart';
import 'package:shop_app/core/routes/app_router.dart';
import 'package:shop_app/core/utils/dimensions.dart';
import 'package:shop_app/widgets/app_logo.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      context.router.replace(LoginRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.bgColor,
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            AppLogo.large(),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(bottom: 14),
              child: Text(
                'ShopEase',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: Dimensions.fontSize18,
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.w600),
              ),
            )
          ],
        )));
  }
}
