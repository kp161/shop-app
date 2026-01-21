import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shop_app/feature/product/model/update_product_model.dart';
import 'package:shop_app/feature/product/repository/product_repository.dart';

class UpdateProductProvider with ChangeNotifier {
  final ProductRepository _productRepository;
  UpdateProductProvider(this._productRepository);

  UpdateProductModel? _updateProduct;
  UpdateProductModel? get updateProduct => _updateProduct;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void clearUpdateProduct() {
    _updateProduct = null;
    notifyListeners();
  }

  Future<bool> updateProductProvider({
    required int id,
    required String title,
    required String description,
    required String category,
    required double price,
    File? image,
  }) async {
    if (_isLoading) return false;

    _isLoading = true;
    notifyListeners();

    try {
      final result = await _productRepository.updateProduct(
          id: id,
          title: title,
          price: price,
          description: description,
          image: image,
          category: category);

      return result.fold(
        (failure) {
          debugPrint("Update Failed: ${failure.message}");
          return false;
        },
        (success) => success,
      );
    } catch (e) {
      debugPrint("Provider Error: $e");
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
