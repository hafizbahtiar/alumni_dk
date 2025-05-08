import 'package:alumni_dk/data/models/user_model.dart';
import 'package:alumni_dk/modules/auth/repos/login_repo.dart';
import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  final LoginRepo _loginRepo;

  LoginProvider(this._loginRepo);

  String _message = '';
  bool _isLoading = false;

  String get message => _message;
  bool get isLoading => _isLoading;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setMessage(String message) {
    _message = message;
    notifyListeners();
  }

  void reset() {
    _isLoading = false;
    _message = '';
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      _setMessage('Email and password cannot be empty');
      return false;
    }

    _setMessage('');
    _setLoading(true);

    try {
      final user = UserModel(email: email).withPassword(password);
      final result = await _loginRepo.login(user);
      final message = result.message;

      if (result.status == true) {
        _setMessage(message ?? 'Login successful');
        _setLoading(false);
        return true;
      } else {
        _setMessage(message ?? 'Login failed');
        _setLoading(false);
        return false;
      }
    } catch (e) {
      _setMessage(e.toString());
      _setLoading(false);
      return false;
    }
  }
}
