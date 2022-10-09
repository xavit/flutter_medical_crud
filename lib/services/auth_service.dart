import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier {
  final String _baseUrl = 'https://dev-ave.online';
  final String _baseUrlLogin =
      'https://xyfjdr4uvj.execute-api.us-east-1.amazonaws.com';

  Future<String> login(String user, String password) async {
    final Map<String, String> body = {
      'username': user,
      'password': password,
      "type_user": "doctor"
    };

    var headers = {'content-type': 'application/json'};

    final url = Uri.parse("$_baseUrlLogin/dev/ave-auth/api/v1/auth/login");

    final resp =
        await http.post(url, headers: headers, body: json.encode(body));

    final Map<String, dynamic> decodeData = json.decode(resp.body);

    print(decodeData);
    if (decodeData.containsKey('token')) {
      // Guardar token en el storage
      return '';
    } else {
      return decodeData['error']['message'];
    }
  }
}
