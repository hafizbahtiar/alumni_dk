import 'package:alumni_dk/data/models/user_model.dart';
import 'package:alumni_dk/modules/auth/repos/login_repo.dart';
import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  final LoginRepo _loginRepo;

  LoginProvider(this._loginRepo);

  String _errorMessage = '';
  bool _isLoading = false;

  String get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setError(String message) {
    _errorMessage = message;
    notifyListeners();
  }

  void clearError() {
    if (_errorMessage.isNotEmpty) {
      _errorMessage = '';
      notifyListeners();
    }
  }

  void reset() {
    _isLoading = false;
    _errorMessage = '';
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      _setError('Email and password cannot be empty');
      return false;
    }

    clearError();
    _setLoading(true);

    try {
      final user = UserModel(email: email).withPassword(password);
      final result = await _loginRepo.login(user);

      if (result['status'] == true) {
        _setLoading(false);
        return true;
      } else {
        _setError(result['message'] ?? 'Login failed');
        _setLoading(false);
        return false;
      }
    } catch (e) {
      _setError(e.toString());
      _setLoading(false);
      return false;
    }
  }
}
