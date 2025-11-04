import 'dart:convert';
import 'package:footybin/common/constants/api_constants.dart';
import 'package:http/http.dart' as http;

abstract class NetworkService {
  Future<Map<String, dynamic>> get(
    String endpoint, {
    Map<String, String>? params,
  });
}

class NetworkServiceImpl extends NetworkService {
  final _client = http.Client();

  @override
  Future<Map<String, dynamic>> get(
    String endpoint, {
    Map<String, String>? params,
  }) async {
    final uri = Uri.parse(
      "${APIConstants.baseUrl}$endpoint",
    ).replace(queryParameters: params);

    try {
      final response = await _client.get(
        uri,
        headers: {"x-apisports-key": APIConstants.apiKey},
      );

      if (response.statusCode == 200) {
        return json.decode(response.body) as Map<String, dynamic>;
      } else {
        throw HttpException(
          message: "Failed with status ${response.statusCode}",
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      throw HttpException(message: "Network error: $e");
    }
  }
}

class HttpException implements Exception {
  final String message;
  final int? statusCode;
  HttpException({required this.message, this.statusCode});

  @override
  String toString() => "HttpException($statusCode): $message";
}
