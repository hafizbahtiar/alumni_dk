import 'package:alumni_dk/core/network/api_response.dart';
import 'package:alumni_dk/data/models/user_model.dart';
import 'package:alumni_dk/modules/auth/services/register_service.dart';

class RegisterRepo {
  final RegisterService _registerService;

  RegisterRepo(this._registerService);

  Future<ApiResponse> register(UserModel user) async {
    try {
      final response = await _registerService.register(user);

      if (response.status && response.body != null) {
        return response;
      }

      return ApiResponse.error(response.message ?? 'Login failed', errors: response.errors);
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }
}
