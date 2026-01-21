import 'package:fpdart/fpdart.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/feature/user/model/user_model.dart';

abstract interface class UserRepository {
  Future<Either<Failure, UserModel>> getMyProfile();

  Future<Either<Failure, bool>> logout();
}