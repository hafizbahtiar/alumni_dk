import 'package:alumni_dk/data/models/user_model.dart';
import 'package:alumni_dk/modules/auth/services/login_service.dart';

class LoginRepo {
  final LoginService _loginService;

  LoginRepo(this._loginService);

  Future<Map<String, dynamic>> login(UserModel user) async {
    try {
      final response = await _loginService.login(user);

      if (response.status && response.body != null) {
        return {'status': true, 'body': response.body};
      }

      return {'status': false, 'message': response.message ?? 'Login failed'};
    } catch (e) {
      return {'status': false, 'message': e.toString()};
    }
  }
}
