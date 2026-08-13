import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AuthApiServices {
  String base_url = 'https://dev.growedge.net/api/auth/';
  Future<Map<String, dynamic>> register({
    required String password,
    required String email,
    required String password_confirmation,
    required String user_type,
  }) async {
    http.Response response = await http.post(
      Uri.parse('$base_url/register'),
      body: {
        'email': email,
        'password_confirmation': password_confirmation,
        'password': password,
        'user_type': user_type,
      },
    );

    return _handleResponse(response);
  }

  _handleResponse(http.Response response) {
    final responseBody = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return responseBody;
    } else {
      return responseBody['message'] ?? 'error in the authentication Aya';
    }
  }
}
