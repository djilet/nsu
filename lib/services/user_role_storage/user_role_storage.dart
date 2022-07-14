import 'package:nsu_cab/services/secure_storage/secure_storage.dart';

const USER_ROLE_DATA = 'userRoleData';

class UserRoleStorage {
  final SecureStorage storage;

  UserRoleStorage({required this.storage});

  Future<String?> getRole() {
    return storage.read<String>(key: USER_ROLE_DATA);
  }

  Future<void> writeRole(String role) {
    return storage.write<String>(key: USER_ROLE_DATA, value: role);
  }

  Future<void> deleteRole() {
    return storage.delete(key: USER_ROLE_DATA);
  }
}
