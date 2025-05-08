import 'package:alumni_dk/core/network/api_response.dart';
import 'package:alumni_dk/data/models/user_model.dart';
import 'package:alumni_dk/modules/auth/services/login_service.dart';

class LoginRepo {
  final LoginService _loginService;

  LoginRepo(this._loginService);

  Future<ApiResponse> login(UserModel user) async {
    try {
      final response = await _loginService.login(user);

      if (response.status && response.body != null) {
        return response;
      }

      return ApiResponse.error(response.message ?? 'Login failed', errors: response.errors);
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }
}
