import '../repositories/auth_repository.dart';
import 'database/database.dart';

class AuthController {
  final authRepository = AuthRepository();

  Future<bool> login(String email, String password) async {
    var token = await authRepository.authenticationAPI(
        email: email, password: password);
    if (token != null) {
      await DB.instance.insertToken(token);
      return true;
    } else {
      return false;
    }
  }
}
