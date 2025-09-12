import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServices {
  final String baseUrl;

  ApiServices({required this.baseUrl});

  Future<Map<String, dynamic>> post(
    String endpoint, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    final response = await http.post(

      Uri.parse('$baseUrl$endpoint'),
      body: jsonEncode(body),
      headers: headers ,
    );

    final responseBody = jsonDecode(response.body);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return responseBody;
    } else {
      return {
        "success": false,
        "statusCode": response.statusCode,
        "message": responseBody  ?? "Unknown error",
      };
    }
  }
}
