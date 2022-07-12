import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Keycloak {
  Future<void> login(String username, String password) async {
    final sso = dotenv.env['SSO_URL'] as String;
    final clientId = dotenv.env['CLIENT_ID'] as String;

    final url = sso + '/protocol/openid-connect/token';

    Map<String, String> headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'cache-control': 'no-cache',
    };

    Map<String, String> data = {
      'client_id': clientId,
      'username': username,
      'passowrd': password,
      'grant_type': 'password1',
    };

    var response = await Dio().post(
      url,
      data: data,
      options: Options(headers: headers),
    );

    if (response.statusCode == 200) {
      print(json.decode(response.data));
    } else {
      print(response.data);
    }
  }
}
