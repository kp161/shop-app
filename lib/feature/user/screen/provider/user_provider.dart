import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shop_app/feature/user/model/user_model.dart';
import 'package:shop_app/feature/user/repository/user_repository.dart';

class UserProvider with ChangeNotifier {
  final UserRepository _userRepository;
  UserProvider(this._userRepository);

  UserModel? _user;
  UserModel? get user => _user;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isLoggedOut = false;
  bool get isLoggedOut => _isLoggedOut;

  Future<bool> getUserProfile() async {
    if (_isLoading) return false;

    _isLoading = true;
    notifyListeners();
    log('getUserProfile CALLED');


    try {
      final result = await _userRepository.getMyProfile();

      return result.fold(
        (failure) {
          _user = null;
          return false;
        },
        (usermodel) {
          log('USER SET: ${usermodel.username}');
          _user = usermodel;
          notifyListeners();
          return true;
        },
      );
    } catch (e) {
      _user = null;
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

   Future<void> logout() async {
    await _userRepository.logout();

    _user = null;
    _isLoggedOut = true;
    notifyListeners();
  }
}
