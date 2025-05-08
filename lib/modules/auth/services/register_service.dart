import 'dart:convert';
import 'package:alumni_dk/core/network/api_client.dart';
import 'package:alumni_dk/core/network/api_endpoint.dart';
import 'package:alumni_dk/core/network/api_response.dart';
import 'package:alumni_dk/data/models/user_model.dart';

class RegisterService {
  final ApiClient _apiClient;

  RegisterService(this._apiClient);

  Future<ApiResponse> register(UserModel user) async {
    try {
      final endpoint = ApiEndpoint.v1.auth.register;
      final response = await _apiClient.post(endpoint, body: user.toRegisterJson());

      final statusCode = response.statusCode;
      final body = response.body;

      if (statusCode >= 200 && statusCode < 300) {
        // Successful response
        final data = jsonDecode(body);
        if (data is Map<String, dynamic>) {
          return ApiResponse.success(data);
        } else {
          return ApiResponse.error('Unexpected response format');
        }
      } else {
        // Handle error responses with more context
        try {
          final error = jsonDecode(body);
          final message =
              error is Map && error['message'] != null ? error['message'] : 'Login failed with status $statusCode';
          final errors = error is Map && error['errors'] != null ? error['errors'] : null;
          return ApiResponse.error(message, errors: errors);
        } catch (_) {
          return ApiResponse.error('Login failed with status $statusCode');
        }
      }
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }
}
