import 'package:flutter/material.dart';
import 'package:shop_app/feature/product/model/delete_product_model.dart';
import 'package:shop_app/feature/product/repository/product_repository.dart';

class DeleteProductProvider with ChangeNotifier{
  final ProductRepository _productRepository;
  DeleteProductProvider(this._productRepository);

  DeleteProductModel? _deleteProduct;
  DeleteProductModel? get deleteProduct => _deleteProduct;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void clearDeletedProduct() {
    _deleteProduct = null;
    notifyListeners();
  }

  Future<bool> deleteProductProvider({required int id}) async {
    if(_isLoading) return false;

    _isLoading = true;
    notifyListeners();

    try{
      final result = await _productRepository.deleteProduct(id: id);

      return result.fold(
        (failure){
          _deleteProduct = null;
          return false;
        },
        (deleteProductModel){
          _deleteProduct = deleteProductModel;
          return true;
        },
      );
    } catch (e) {
      _deleteProduct = null;
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}