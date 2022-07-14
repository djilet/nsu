import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:nsu_cab/modules/app/router/router.dart';
import 'package:nsu_cab/services/keycloak_refresh_token_storage/keycloak_refresh_token_storage.dart';
import 'package:nsu_cab/services/keycloak_token_storage/keycloak_token_storage.dart';

class Keycloak {
  final KeycloakTokenStorage keycloakTokenStorage;
  final KeycloakRefreshTokenStorage keycloakRefreshTokenStorage;
  final GlobalKey<NavigatorState> navigatorKey;

  Keycloak({
    required this.keycloakTokenStorage,
    required this.keycloakRefreshTokenStorage,
    required this.navigatorKey,
  });

  Future<void> getTokens(String login, String password) async {
    final clientId = dotenv.env['CLIENT_ID'] as String;
    final url = dotenv.env['SSO_URL'] as String;

    final headers = _getHeaders();

    Map<String, String> data = {
      'client_id': clientId,
      'username': login,
      'password': password,
      'grant_type': 'password',
    };

    var response = await Dio().post(
      url,
      data: data,
      options: Options(headers: headers),
    );

    if (response.statusCode == 200) {
      // await keycloakTokenStorage.writeToken(response.data['access_token']);
      // await keycloakRefreshTokenStorage.writeToken(
      // response.data['refresh_token'],
      // );
    } else {
      navigatorKey.currentState!.pushNamedAndRemoveUntil(
        Routes.welcome,
        (route) => false,
      );
    }
  }

  Future<void> updateTokens() async {
    final clientId = dotenv.env['CLIENT_ID'] as String;
    final url = dotenv.env['SSO_URL'] as String;

    final headers = _getHeaders();

    // final refreshToken = await keycloakRefreshTokenStorage.getToken() ?? '';

    Map<String, String> data = {
      'client_id': clientId,
      // 'refresh_token': refreshToken,
      'grant_type': 'refresh_token',
    };

    var response = await Dio().post(
      url,
      data: data,
      options: Options(headers: headers),
    );

    if (response.statusCode == 200) {
      // await keycloakTokenStorage.writeToken(response.data['access_token']);
      // await keycloakRefreshTokenStorage.writeToken(
      // response.data['refresh_token'],
      // );
    } else {
      navigatorKey.currentState!.pushNamedAndRemoveUntil(
        Routes.welcome,
        (route) => false,
      );
    }
  }

  Map<String, String> _getHeaders() => {
        'content-type': 'application/x-www-form-urlencoded',
        'cache-control': 'no-cache',
      };
}
