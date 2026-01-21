// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AddProductScreen]
class AddProductRoute extends PageRouteInfo<void> {
  const AddProductRoute({List<PageRouteInfo>? children})
      : super(AddProductRoute.name, initialChildren: children);

  static const String name = 'AddProductRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const AddProductScreen());
    },
  );
}

/// generated route for
/// [BottomBarScreen]
class BottomBarRoute extends PageRouteInfo<void> {
  const BottomBarRoute({List<PageRouteInfo>? children})
      : super(BottomBarRoute.name, initialChildren: children);

  static const String name = 'BottomBarRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const BottomBarScreen();
    },
  );
}

/// generated route for
/// [GetAllProductScreen]
class GetAllProductRoute extends PageRouteInfo<void> {
  const GetAllProductRoute({List<PageRouteInfo>? children})
      : super(GetAllProductRoute.name, initialChildren: children);

  static const String name = 'GetAllProductRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const GetAllProductScreen());
    },
  );
}

/// generated route for
/// [GetOneProductScreen]
class GetOneProductRoute extends PageRouteInfo<GetOneProductRouteArgs> {
  GetOneProductRoute({Key? key, required int id, List<PageRouteInfo>? children})
      : super(
          GetOneProductRoute.name,
          args: GetOneProductRouteArgs(key: key, id: id),
          initialChildren: children,
        );

  static const String name = 'GetOneProductRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<GetOneProductRouteArgs>();
      return WrappedRoute(
        child: GetOneProductScreen(key: args.key, id: args.id),
      );
    },
  );
}

class GetOneProductRouteArgs {
  const GetOneProductRouteArgs({this.key, required this.id});

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'GetOneProductRouteArgs{key: $key, id: $id}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! GetOneProductRouteArgs) return false;
    return key == other.key && id == other.id;
  }

  @override
  int get hashCode => key.hashCode ^ id.hashCode;
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({Key? key, List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginRouteArgs>(
        orElse: () => const LoginRouteArgs(),
      );
      return WrappedRoute(child: LoginScreen(key: args.key));
    },
  );
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LoginRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashScreen();
    },
  );
}

/// generated route for
/// [UpdateProductScreen]
class UpdateProductRoute extends PageRouteInfo<UpdateProductRouteArgs> {
  UpdateProductRoute({
    Key? key,
    required GetOneProductModel product,
    List<PageRouteInfo>? children,
  }) : super(
          UpdateProductRoute.name,
          args: UpdateProductRouteArgs(key: key, product: product),
          initialChildren: children,
        );

  static const String name = 'UpdateProductRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<UpdateProductRouteArgs>();
      return WrappedRoute(
        child: UpdateProductScreen(key: args.key, product: args.product),
      );
    },
  );
}

class UpdateProductRouteArgs {
  const UpdateProductRouteArgs({this.key, required this.product});

  final Key? key;

  final GetOneProductModel product;

  @override
  String toString() {
    return 'UpdateProductRouteArgs{key: $key, product: $product}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! UpdateProductRouteArgs) return false;
    return key == other.key && product == other.product;
  }

  @override
  int get hashCode => key.hashCode ^ product.hashCode;
}

/// generated route for
/// [UserProfileScreen]
class UserProfileRoute extends PageRouteInfo<void> {
  const UserProfileRoute({List<PageRouteInfo>? children})
      : super(UserProfileRoute.name, initialChildren: children);

  static const String name = 'UserProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const UserProfileScreen());
    },
  );
}
