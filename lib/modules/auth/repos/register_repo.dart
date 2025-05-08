import 'package:alumni_dk/data/models/user_model.dart';
import 'package:alumni_dk/modules/auth/services/register_service.dart';

class RegisterRepo {
  final RegisterService _registerService;

  RegisterRepo(this._registerService);

  Future<Map<String, dynamic>> register(UserModel user) async {
    try {
      final response = await _registerService.register(user);

      if (response.status && response.body != null) {
        return {'status': true, 'body': response.body};
      }

      return {'status': false, 'message': response.message ?? 'Login failed'};
    } catch (e) {
      return {'status': false, 'message': e.toString()};
    }
  }
}
