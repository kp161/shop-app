import 'package:auto_route/auto_route.dart';
import 'package:shop_app/core/utils/preference_utils.dart';
import 'package:shop_app/core/routes/app_router.dart';

class AuthGuard extends AutoRouteGuard{
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final token = getString('token');

    if(token.isNotEmpty){
      resolver.next();
    } else {
      router.replace(LoginRoute());
    }
  }
}