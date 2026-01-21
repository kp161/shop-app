import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_app/core/di/injection.dart';
import 'package:shop_app/core/routes/app_router.dart';
import 'package:shop_app/core/utils/preference_utils.dart';
import 'package:shop_app/feature/auth/repository/auth_repository.dart';
import 'package:shop_app/feature/auth/screens/login/provider/login_provider.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/feature/product/screens/add_product/provider/add_product_provider.dart';
import 'package:shop_app/feature/product/screens/get_all_products/provider/get_all_product_provider.dart';
import 'package:shop_app/feature/product/repository/product_repository.dart';
import 'package:shop_app/feature/user/repository/user_repository.dart';
import 'package:shop_app/feature/user/screen/provider/user_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  await configureDependencies();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  ));

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => LoginProvider(sl<AuthRepository>())),
    ChangeNotifierProvider(
        create: (_) => GetAllProductProvider(sl<ProductRepository>())),
    ChangeNotifierProvider(
        create: (_) => AddProductProvider(sl<ProductRepository>())),
    ChangeNotifierProvider(create: (_) => UserProvider(sl<UserRepository>())),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routerConfig: appRouter.config(),
    );
  }
}
