import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  final String baseUrl;

  ApiServices({required this.baseUrl});

  Future<Map<String, dynamic>> post(
    String endpoint, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl$endpoint'),
        body: jsonEncode(body),
        headers: headers,
      );

      final responseBody = jsonDecode(response.body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return responseBody;
      } else {
        debugPrint(
          "status code: ${response.statusCode} and body: $responseBody",
        );
        return {
          "success": false,
          "statusCode": response.statusCode,
          "message": responseBody ?? "Unknown error",
        };
      }
    } on SocketException {
      throw Exception("لا يوجد اتصال بالإنترنت");
    } catch (e) {
      throw Exception("مشكلة في الاتصال بالخادم: $e");
    }
  }
}
