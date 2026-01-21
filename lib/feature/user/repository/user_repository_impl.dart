import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/widgets.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shop_app/core/connection/connection_checker.dart';
import 'package:shop_app/core/di/injection.dart';
import 'package:shop_app/core/error/exceptions.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/core/utils/api_constant.dart';
import 'package:shop_app/core/utils/preference_utils.dart';
import 'package:shop_app/data/repository/api_repository.dart';
import 'package:shop_app/data/repository/api_repository_impl.dart';
import 'package:shop_app/feature/user/model/user_model.dart';
import 'package:shop_app/feature/user/repository/user_repository.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  static final UserRepositoryImpl _instance =
      UserRepositoryImpl._internal(sl<ConnectionChecker>());

  final ConnectionChecker connectionChecker;

  factory UserRepositoryImpl() {
    return _instance;
  }

  UserRepositoryImpl._internal(this.connectionChecker);

  @override
  Future<Either<Failure, UserModel>> getMyProfile() async {

    final token = getString('accessToken');

    if(token.isEmpty){
      return left(const Failure(message: 'User not authenticated'));
    }

    final Map<String, dynamic> decodedToken = Jwt.parseJwt(token);
    final int userId = decodedToken['sub'];

    final ApiRepository apiRepository = ApiRepositoryImpl(sl<Connectivity>());

    return _getUserProfile(() async {
      final response = await apiRepository.get(ApiConstant.user(userId));

      debugPrint('PROFILE RAW RESPONSE: $response');

      Map<String, dynamic> dataToParse;


      if(response is Map<String, dynamic> && response.containsKey('data')) {
        dataToParse = Map<String, dynamic>.from(response['data']);
      } else if(response is Map<String, dynamic>){
        dataToParse = response;
      } else {
        throw const ServerException('Invalid user profile response', 500);
      }

      return UserModel.fromJson(dataToParse);
    });
  }

  Future<Either<Failure, UserModel>> _getUserProfile(
    Future<UserModel> Function() fn,
  ) async {
    try{
      if(!await connectionChecker.isConnected){
        return left(Failure.networkError());
      }

      final user = await fn();
      return right(user);
    } on ServerException catch (e){
      return left(Failure.fromServerError(e.message, e.statusCode));
    } catch (e) {
      return left(
        Failure(message: 'An unexpected error occurred: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> logout() async {
    try {
      await remove('accessToken');
      await remove('rememberMe');
      return right(true);
    } catch (e) {
      return left(Failure(message: 'Logout failed: ${e.toString()}'));
    }
  }
}
