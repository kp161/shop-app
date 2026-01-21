import 'package:flutter/material.dart';
import 'package:shop_app/core/utils/preference_utils.dart';
import 'package:shop_app/feature/auth/model/login_model.dart';
import 'package:shop_app/feature/auth/repository/auth_repository.dart';

class LoginProvider with ChangeNotifier {
  final AuthRepository _authRepository;
  LoginProvider(this._authRepository);

  LoginModel? _user;
  bool _isLoading = false;
  bool _rememberMe = false;

  LoginModel? get user => _user;
  bool get isLoading => _isLoading;
  bool get rememberMe => _rememberMe;

  Future<void> loadRememberMe() async {
    _rememberMe = getBool('rememberMe');
    notifyListeners();
  }

  void toggleRememberMe(bool value) {
    _rememberMe = value;
    notifyListeners();
  }

  Future<void> setRememberMe(bool value) async {
    _rememberMe = value;
    await setBool('rememberMe', value);
    notifyListeners();
  }

  Future<bool> login(String username, String password) async {
    if (_isLoading) return false;

    _isLoading = true;
    notifyListeners();

    try {
      // Simulate API delay (optional)
      await Future.delayed(const Duration(seconds: 2));

      final result = await _authRepository.loginWithEmailPassword(
        username: username,
        password: password,
      );

      return await result.fold(
        (failure) async {
          _user = null;
          return false;
        },
        (loginModel) async {
          _user = loginModel;

          await setString('token', loginModel.token ?? '');

          // Save remember me preference only after successful login
          if (_rememberMe) {
            await setBool('rememberMe', true);
          }

          return loginModel.token?.isNotEmpty ?? false;
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
}
