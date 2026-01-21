import 'package:flutter/material.dart';
import 'package:shop_app/feature/product/model/get_all_product_model.dart';
import 'package:shop_app/feature/product/repository/product_repository.dart';

class GetAllProductProvider with ChangeNotifier {
  final ProductRepository _productRepository;
  GetAllProductProvider(this._productRepository);

  List<GetAllProductModel> _products = [];
  List<GetAllProductModel> get products => _products;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void clearProducts() {
    _products = [];
    notifyListeners();
  }

  Future<bool> getAllProducts() async {
    if (_isLoading) return false;

    _isLoading = true;
    notifyListeners();

    try {
      final result = await _productRepository.getAllProducts();

      return result.fold(
        (failure) {
          _products = [];
          return false;
        },
        (productList) {
          _products = productList;
          return _products.isNotEmpty;
        },
      );
    } catch (e) {
      _products = [];
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
