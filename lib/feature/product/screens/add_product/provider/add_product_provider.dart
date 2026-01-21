import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shop_app/feature/product/model/add_product_model.dart';
import 'package:shop_app/feature/product/repository/product_repository.dart';

class AddProductProvider with ChangeNotifier {
  final ProductRepository _productRepository;
  AddProductProvider(this._productRepository);

  AddProductModel? _product;
  AddProductModel? get product => _product;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void clearProduct(){
    _product = null;
    notifyListeners();
  }

  Future<bool> addProductProvider({
    required String title,
    required String description,
    required String category,
    required File image,
    required double price,
  }) async {
    if (_isLoading) return false;

    _isLoading = true;
    notifyListeners();

    try {
      final result = await _productRepository.addProduct(
          title: title,
          price: price,
          description: description,
          image: image,
          category: category);

      return result.fold(
        (failure) {
          _product = null;
          return false;
        },
        (addProductModel) {
          _product = addProductModel;
          return _product?.id != null;
        },
      );
    } catch (e) {
      _product = null;
      return false;
    } 
    finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
