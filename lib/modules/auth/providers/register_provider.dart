import 'package:alumni_dk/data/models/user_model.dart';
import 'package:alumni_dk/modules/auth/repos/register_repo.dart';
import 'package:flutter/material.dart';

class RegisterProvider with ChangeNotifier {
  final RegisterRepo _registerRepo;

  RegisterProvider(this._registerRepo);

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

  Future<bool> register(String email, String name, String password, String confirmPassword) async {
    if (email.isEmpty || name.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      _setError('Email, name, password, and confirm password cannot be empty');
      return false;
    }

    if (password != confirmPassword) {
      _setError('Passwords do not match');
      return false;
    }

    clearError();
    _setLoading(true);

    try {
      final user = UserModel(name: name, email: email).forRegister(password, confirmPassword);
      final result = await _registerRepo.register(user);

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
