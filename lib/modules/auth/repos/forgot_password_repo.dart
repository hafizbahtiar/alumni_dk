import 'package:alumni_dk/core/network/api_response.dart';
import 'package:alumni_dk/data/models/user_model.dart';
import 'package:alumni_dk/modules/auth/services/forgot_password_service.dart';

class ForgotPasswordRepo {
  final ForgotPasswordService _forgotPasswordService;

  ForgotPasswordRepo(this._forgotPasswordService);

  Future<ApiResponse> requestPasswordReset(UserModel user) async {
    try {
      final response = await _forgotPasswordService.requestPasswordReset(user);

      if (response.status && response.body != null) {
        return response;
      }

      return ApiResponse.error(response.message ?? 'Login failed', errors: response.errors);
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }
}
