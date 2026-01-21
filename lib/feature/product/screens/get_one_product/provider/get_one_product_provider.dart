import 'package:flutter/material.dart';
import 'package:shop_app/feature/product/model/get_one_product_model.dart';
import 'package:shop_app/feature/product/repository/product_repository.dart';

class GetOneProductProvider with ChangeNotifier{
  final ProductRepository _productRepository;
  GetOneProductProvider(this._productRepository);

  GetOneProductModel? _product;
  GetOneProductModel? get product => _product;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  void updateProductLocally(GetOneProductModel updatedProduct){
    _product = updatedProduct;
    notifyListeners();
  }

  Future<bool> getProductById({required int id}) async {

    _isLoading = true;
    _error = null;
    notifyListeners();

    try{
      final result = await _productRepository.getOneproduct(id: id);

      return result.fold(
        (failure){
          _error = failure.message;
          _product = null;
          return false;
        },
        (productModel){
          _product = productModel;
          return true;
        },
      );
    } catch (e){
      _error = 'Something went wrong';
      _product = null;
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clear() {
    _product = null;
    _error = null;
    _isLoading = false;
    notifyListeners();
  }
}