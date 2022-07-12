import 'package:nsu_cab/services/secure_storage/secure_storage.dart';

abstract class ITokenStorage {
  Future<void> writeToken(String token);
  Future<void> deleteToken();
  Future<String?> getToken();
}

const ACCESS_TOKEN_KEY = 'accessToken';

class TokenStorage implements ITokenStorage {
  final ISecureStorage storage;

  TokenStorage({required this.storage});

  @override
  Future<String?> getToken() {
    return storage.read<String>(key: ACCESS_TOKEN_KEY);
  }

  @override
  Future<void> writeToken(String token) {
    return storage.write<String>(key: ACCESS_TOKEN_KEY, value: token);
  }

  @override
  Future<void> deleteToken() {
    return storage.delete(key: ACCESS_TOKEN_KEY);
  }
}
