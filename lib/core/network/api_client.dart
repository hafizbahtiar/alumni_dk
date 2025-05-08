import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();
  factory ApiClient() => _instance;

  ApiClient._internal();

  final String _baseUrl = "${dotenv.env['BASE_URL']}/api";

  Future<http.Response> get(String endpoint, {Map<String, String>? additionalHeaders}) async {
    final url = Uri.parse('$_baseUrl$endpoint');
    final headers = _buildHeaders(additionalHeaders: additionalHeaders);
    return await http.get(url, headers: headers);
  }

  Future<http.Response> post(String endpoint, {Map<String, String>? additionalHeaders, dynamic body}) async {
    final url = Uri.parse('$_baseUrl$endpoint');
    final headers = _buildHeaders(additionalHeaders: additionalHeaders);
    return await http.post(url, headers: headers, body: jsonEncode(body));
  }

  Future<http.Response> put(String endpoint, {Map<String, String>? additionalHeaders, dynamic body}) async {
    final url = Uri.parse('$_baseUrl$endpoint');
    final headers = _buildHeaders(additionalHeaders: additionalHeaders);
    return await http.put(url, headers: headers, body: jsonEncode(body));
  }

  Future<http.Response> delete(String endpoint, {Map<String, String>? additionalHeaders}) async {
    final url = Uri.parse('$_baseUrl$endpoint');
    final headers = _buildHeaders(additionalHeaders: additionalHeaders);
    return await http.delete(url, headers: headers);
  }

  Map<String, String> _buildHeaders({Map<String, String>? additionalHeaders}) {
    final defaultHeaders = {'Content-Type': 'application/json', 'Accept': 'application/json'};

    if (additionalHeaders != null) {
      defaultHeaders.addAll(additionalHeaders);
    }

    return defaultHeaders;
  }
}
