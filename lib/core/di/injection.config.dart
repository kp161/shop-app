// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shop_app/core/connection/connection_checker.dart' as _i269;
import 'package:shop_app/data/repository/api_repository.dart' as _i1032;
import 'package:shop_app/data/repository/api_repository_impl.dart' as _i272;
import 'package:shop_app/feature/auth/repository/auth_repository.dart'
    as _i1065;
import 'package:shop_app/feature/auth/repository/auth_repository_impl.dart'
    as _i364;
import 'package:shop_app/feature/product/repository/product_repository.dart'
    as _i618;
import 'package:shop_app/feature/product/repository/product_repository_impl.dart'
    as _i425;
import 'package:shop_app/feature/user/repository/user_repository.dart' as _i752;
import 'package:shop_app/feature/user/repository/user_repository_impl.dart'
    as _i280;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i269.ConnectionChecker>(
        () => _i269.ConnectionCheckerImpl(gh<_i895.Connectivity>()));
    gh.factory<_i1065.AuthRepository>(() => _i364.AuthRepositoryImpl());
    gh.factory<_i1032.ApiRepository>(
        () => _i272.ApiRepositoryImpl(gh<_i895.Connectivity>()));
    gh.factory<_i618.ProductRepository>(() => _i425.ProductRepositoryImpl());
    gh.factory<_i752.UserRepository>(() => _i280.UserRepositoryImpl());
    return this;
  }
}
