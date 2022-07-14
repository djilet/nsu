import 'package:nsu_cab/services/secure_storage/secure_storage.dart';

const ACCESS_TOKEN_KEY = 'accessKeycloakToken';

class KeycloakTokenStorage {
  final SecureStorage storage;

  KeycloakTokenStorage({required this.storage});

  Future<String?> getToken() {
    return storage.read<String>(key: ACCESS_TOKEN_KEY);
  }

  Future<void> writeToken(String token) {
    return storage.write<String>(key: ACCESS_TOKEN_KEY, value: token);
  }

  Future<void> deleteToken() {
    return storage.delete(key: ACCESS_TOKEN_KEY);
  }
}
