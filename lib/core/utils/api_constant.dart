import 'package:shop_app/core/env/env.dart';

class ApiConstant {
  static const String appbaseUrl = Env.baseUrl;
  static const String loginUrl = 'auth/login';
  static const String products = 'products';
  static String getProUrl(int id) => 'products/$id';
  static String updateProUrl(int id) => 'products/$id';
  static String deleteProUrl(int id) => 'products/$id';
  static String user(int id) => 'users/$id';
}