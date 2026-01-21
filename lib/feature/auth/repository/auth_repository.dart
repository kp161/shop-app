import 'package:fpdart/fpdart.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/feature/auth/model/login_model.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, LoginModel>> loginWithEmailPassword({
    required String username,
    required String password,
  });
}