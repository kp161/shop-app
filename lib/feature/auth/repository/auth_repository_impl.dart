import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:shop_app/core/connection/connection_checker.dart';
import 'package:shop_app/core/di/injection.dart';
import 'package:shop_app/core/error/exceptions.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/core/utils/api_constant.dart';
import 'package:shop_app/core/utils/preference_utils.dart';
import 'package:shop_app/data/repository/api_repository.dart';
import 'package:shop_app/data/repository/api_repository_impl.dart';
import 'package:shop_app/feature/auth/model/login_model.dart';
import 'package:shop_app/feature/auth/repository/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  static final AuthRepositoryImpl _instance = AuthRepositoryImpl._internal(
    sl<ConnectionChecker>(),
  );
  final ConnectionChecker connectionChecker;
  factory AuthRepositoryImpl() {
    return _instance;
  }

  AuthRepositoryImpl._internal(this.connectionChecker);

  @override
  Future<Either<Failure, LoginModel>> loginWithEmailPassword({
    required String username,
    required String password
  }) async {
    ApiRepository apiRepository = ApiRepositoryImpl(sl<Connectivity>());

    var data = <String, dynamic>{
      'username': username,
      'password': password,
    };

    return _getUserLogin(() async {
      final response = await apiRepository.post(ApiConstant.loginUrl, data);
      log('Login response: $response');
      final user = LoginModel.fromJson(response['data']);
      if (user.token == null || user.token!.isEmpty) {
        throw const ServerException('Login failed: Token missing', 401);
      }

      await setString('accessToken', user.token!);
      log('Access Token: ${user.token}');
      return user;
    });
  }

  Future<Either<Failure, LoginModel>> _getUserLogin<T>(
    Future<LoginModel> Function() fn,
  ) async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return left(Failure.networkError());
      }
      final user = await fn();
      return right(user);
    } on AppException catch (e) {
      final failure = e.toFailure();
      log('Handled AppException: ${failure.message}');
      return left(failure);
    } catch (e, stack) {
      log('Unexpected Exception: $e\nStackTrace: $stack');
      return left(
          Failure(message: 'An unexpected error occurred: ${e.toString()}'));
    }
  }
}
