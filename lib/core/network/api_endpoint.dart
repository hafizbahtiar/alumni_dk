class ApiEndpoint {
  // Version 1 Endpoints
  static var v1 = _V1();

  // Add more versions (e.g., v2) as needed in the future
}

class _V1 {
  // Authentication Endpoints
  final auth = _AuthV1();

  // User Endpoints
  final user = _UserV1();

  // Alumni Endpoints
  final alumni = _AlumniV1();
}

class _AuthV1 {
  final String login = '/v1/auth/login';
  final String register = '/v1/auth/register';
}

class _UserV1 {
  final String profile = '/v1/user/profile';
  final String update = '/v1/user/update';
}

class _AlumniV1 {
  final String list = '/v1/alumni/list';
  final String details = '/v1/alumni/details';
}
