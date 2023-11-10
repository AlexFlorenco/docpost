import 'package:docpost/app/controllers/database/user_secure_storage.dart';

import '../repositories/auth_repository.dart';

class AuthController {
  final authRepository = AuthRepository();

  Future<bool> login(String email, String password) async {
    var token = await authRepository.authenticationAPI(
        email: email, password: password);
    if (token != null) {
      UserSecureStorage().saveToken(token);
      return true;
    } else {
      return false;
    }
  }
}
