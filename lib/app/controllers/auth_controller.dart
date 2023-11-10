import 'package:docpost/app/controllers/database/user_secure_storage.dart';

import '../repositories/auth_repository.dart';

class AuthController {
  final authRepository = AuthRepository();
  final storage = UserSecureStorage();

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

  Future<bool> isAuthenticated() async {
    var token = await storage.getToken();
    if (token != null) {
      print('Usuário autenticado!');
      return true;
    }
    print('Usuário não autenticado!');
    return false;
  }
}
