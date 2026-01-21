import 'package:auto_route/auto_route.dart';
import 'package:shop_app/core/routes/auth_guard.dart';
import 'package:shop_app/feature/auth/screens/login/ui/page/login_page.dart';
import 'package:shop_app/feature/user/screen/ui/user_profile.dart';
import 'package:shop_app/ui/bottom_bar_screen.dart';
import 'package:shop_app/ui/splash_screen.dart';
import 'package:shop_app/feature/product/screens/get_all_products/ui/get_all_product_screen.dart';
import 'package:shop_app/feature/product/screens/get_one_product/ui/get_one_product_screen.dart';
import 'package:shop_app/feature/product/screens/update_product/ui/update_product_screen.dart';
import 'package:shop_app/feature/product/model/get_one_product_model.dart';
import 'package:shop_app/feature/product/screens/add_product/ui/add_product_screen.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  AppRouter({required this.authGuard});
  final AuthGuard authGuard;

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(
          page: BottomBarRoute.page,
          children: [
            AutoRoute(page: GetAllProductRoute.page, initial: true),
            AutoRoute(page: AddProductRoute.page),
            AutoRoute(page: UserProfileRoute.page),
          ],
        ),
        AutoRoute(page: GetOneProductRoute.page),
        CustomRoute(
          page: UpdateProductRoute.page,
          transitionsBuilder:
              TransitionsBuilders.noTransition, // Test with no transition
        ),
      ];
}

final AppRouter appRouter = AppRouter(authGuard: AuthGuard());
