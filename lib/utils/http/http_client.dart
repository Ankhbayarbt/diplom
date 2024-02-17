import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpHelper {
  static const String _baseUrl = "";

  // Get Request
  static Future<Map<String, dynamic>> get(String endpoint) async {
    final response = await http.get(Uri.parse('$_baseUrl/ $endpoint'));
    return _handleResponse(response);
  }

  // TODO: Post Request
  // TODO: Put Request
  // TODO: Delete Request
  static Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}
