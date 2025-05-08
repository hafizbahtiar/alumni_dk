class ApiResponse {
  final bool status;
  final Map<String, dynamic>? body;
  final Map<String, dynamic>? errors;
  final String? message;

  ApiResponse({required this.status, this.body, this.message, this.errors});

  factory ApiResponse.success(Map<String, dynamic> body) {
    return ApiResponse(status: true, body: body);
  }

  factory ApiResponse.error(String message, {Map<String, dynamic>? errors}) {
    return ApiResponse(status: false, message: message, errors: errors);
  }
}
