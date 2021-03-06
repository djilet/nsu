import 'package:nsu_cab/services/secure_storage/secure_storage.dart';

const REFRESH_TOKEN_KEY = 'accessKeycloakRefreshToken';

class KeycloakRefreshTokenStorage {
  final SecureStorage storage;

  KeycloakRefreshTokenStorage({required this.storage});

  Future<String?> getToken() {
    return storage.read<String>(key: REFRESH_TOKEN_KEY);
  }

  Future<void> writeToken(String token) {
    return storage.write<String>(key: REFRESH_TOKEN_KEY, value: token);
  }

  Future<void> deleteToken() {
    return storage.delete(key: REFRESH_TOKEN_KEY);
  }
}
