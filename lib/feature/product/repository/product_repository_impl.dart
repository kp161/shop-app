import 'dart:developer';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:shop_app/core/connection/connection_checker.dart';
import 'package:shop_app/core/di/injection.dart';
import 'package:shop_app/core/error/exceptions.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/core/utils/api_constant.dart';
import 'package:shop_app/core/utils/isolate_parser.dart';
import 'package:shop_app/core/utils/preference_utils.dart';
import 'package:shop_app/data/repository/api_repository.dart';
import 'package:shop_app/data/repository/api_repository_impl.dart';
import 'package:shop_app/feature/product/model/add_product_model.dart';
import 'package:shop_app/feature/product/model/delete_product_model.dart';
import 'package:shop_app/feature/product/model/get_all_product_model.dart';
import 'package:shop_app/feature/product/model/get_one_product_model.dart';
import 'package:shop_app/feature/product/repository/product_repository.dart';

@Injectable(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  static final ProductRepositoryImpl _instance =
      ProductRepositoryImpl._internal(sl<ConnectionChecker>());
 
  final ConnectionChecker connectionChecker;

  factory ProductRepositoryImpl() {
    return _instance;
  }

  ProductRepositoryImpl._internal(this.connectionChecker);

  @override
  Future<Either<Failure, AddProductModel>> addProduct(
      {required String title,
      required double price,
      required String description,
      required File image,
      required String category}) async {
    ApiRepository apiRepository = ApiRepositoryImpl(sl<Connectivity>());

    return _addProduct(() async {
      final formData = FormData.fromMap({
        'title': title,
        'price': price,
        'description': description,
        'category': category,
        'image': await MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
        )
      });

      final response = await apiRepository.post(ApiConstant.products, formData);

      return AddProductModel.fromJson(response['data']);
    });
  }

  Future<Either<Failure, AddProductModel>> _addProduct(
      Future<AddProductModel> Function() fn) async {
    try {
      if (!await connectionChecker.isConnected) {
        return left(Failure.networkError());
      }

      final result = await fn();
      return right(result);
    } on ServerException catch (e) {
      return left(
        Failure.fromServerError(e.message, e.statusCode),
      );
    } catch (e) {
      return left(
        Failure(message: 'Unexpected error: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Either<Failure, DeleteProductModel>> deleteProduct(
      {required int id}) async {
    ApiRepository apiRepository = ApiRepositoryImpl(sl<Connectivity>());
    final token = getString('token');

    return _deleteProduct(() async {
      final response = await apiRepository.delete(
        ApiConstant.deleteProUrl(id),
        token,
      );
      final deleteProductResponse =
          DeleteProductModel.fromJson(response);
      log('Product deleted successfully');
      log(response.toString());

      return deleteProductResponse;
    });
  }

  @override
  Future<Either<Failure, List<GetAllProductModel>>> getAllProducts() {
    ApiRepository apiRepository = ApiRepositoryImpl(sl<Connectivity>());

    return _getAllproduct(() async {
      final response = await apiRepository.get(ApiConstant.products);

      final List<GetAllProductModel> products = (response['data'] as List)
          .map((e) => GetAllProductModel.fromJson(e))
          .toList();

      return products;
    });
  }

  Future<Either<Failure, T>> _getAllproduct<T>(
    Future<T> Function() fn,
  ) async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return left(Failure.networkError());
      }
      final user = await fn();
      return right(user);
    } on ServerException catch (e) {
      return left(Failure.fromServerError(e.message, e.statusCode));
    } catch (e) {
      return left(
          Failure(message: 'An unexpected error occurred: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, GetOneProductModel>> getOneproduct({required int id}) {
    ApiRepository apiRepository = ApiRepositoryImpl(sl<Connectivity>());
    return _getOneProduct(() async {
      log('API URL: ${ApiConstant.getProUrl(id)}');

      final response = await apiRepository.get(
        ApiConstant.getProUrl(id),
      );

      final productJson = response['data'] as Map<String, dynamic>;

      log(response.toString());

      final getOneProductResponse = await IsolateParser.parse(
        (json) => GetOneProductModel.fromJson(json),
        productJson,
      );

      return getOneProductResponse;
    });
  }

  Future<Either<Failure, GetOneProductModel>> _getOneProduct(
    Future<GetOneProductModel> Function() fn,
  ) async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return left(Failure.networkError());
      }
      final user = await fn();
      return right(user);
    } on ServerException catch (e) {
      return left(Failure.fromServerError(e.message, e.statusCode));
    } catch (e) {
      return left(
          Failure(message: 'An unexpected error occurred: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, bool>> updateProduct({
    required int id,
    String? title,
    double? price,
    String? description,
    File? image,
    String? category,
  }) async {
    final apiRepository = ApiRepositoryImpl(sl<Connectivity>());

    return _updateProduct(() async {
      final body = <String, dynamic>{
        if (title != null) 'title': title,
        if (price != null) 'price': price,
        if (description != null) 'description': description,
        if (category != null) 'category': category,
      };

      dynamic response;

      ///Add image
      if (image == null) {
        response = await apiRepository.put(ApiConstant.updateProUrl(id), body);
      } else {
        body['image'] = await MultipartFile.fromFile(image.path,
            filename: image.path.split('/').last);

        final formData = FormData.fromMap(body);

        response = await apiRepository.rawPut(
            ApiConstant.updateProUrl(id), id.toString(), formData);
      }

      if (response != null) {
        return true;
      }

      throw const ServerException('Failed to update product', 500);
    });
  }

  Future<Either<Failure, bool>> _updateProduct(
    Future<bool> Function() fn,
  ) async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return left(Failure.networkError());
      }
      final user = await fn();
      return right(user);
    } on ServerException catch (e) {
      return left(Failure.fromServerError(e.message, e.statusCode));
    } catch (e) {
      return left(
          Failure(message: 'An unexpected error occurred: ${e.toString()}'));
    }
  }

  Future<Either<Failure, DeleteProductModel>> _deleteProduct(
      Future<DeleteProductModel> Function() fn) async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return left(Failure.networkError());
      }
      final user = await fn();

      return right(user);
    } on ServerException catch (e) {
      return left(Failure.fromServerError(e.message, e.statusCode));
    } catch (e) {
      return left(
          Failure(message: 'An unexpected error occurred: ${e.toString()}'));
    }
  }
}
