class ApiResponse {
  final bool status;
  final Map<String, dynamic>? body;
  final String? message;

  ApiResponse({required this.status, this.body, this.message});

  factory ApiResponse.success(Map<String, dynamic> body) {
    return ApiResponse(status: true, body: body);
  }

  factory ApiResponse.error(String message) {
    return ApiResponse(status: false, message: message);
  }
}
