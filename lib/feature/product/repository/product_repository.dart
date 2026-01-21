import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/feature/product/model/add_product_model.dart';
import 'package:shop_app/feature/product/model/delete_product_model.dart';
import 'package:shop_app/feature/product/model/get_all_product_model.dart';
import 'package:shop_app/feature/product/model/get_one_product_model.dart';

abstract interface class ProductRepository {
  Future<Either<Failure, AddProductModel>> addProduct({
    required String title,
    required double price,
    required String description,
    required File image,
    required String category,
  });

  Future<Either<Failure, DeleteProductModel>> deleteProduct({required int id});

  Future<Either<Failure, List<GetAllProductModel>>> getAllProducts();

  Future<Either<Failure, GetOneProductModel>> getOneproduct({required int id});

  Future<Either<Failure, bool>> updateProduct({
    required int id,
    String? title,
    double? price,
    String? description,
    File? image,
    String? category,
  });
}
