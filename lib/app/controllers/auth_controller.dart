import 'package:docpost/app/controllers/database/user_secure_storage.dart';
import 'package:get/get.dart';
import 'dart:convert';
import '../repositories/auth_repository.dart';

class AuthController extends GetxController {
  final authRepository = AuthRepository();
  final storage = UserSecureStorage();
  RxBool isAuthenticated = false.obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    checkAuthentication();
  }

  Future<bool> login(String email, String password) async {
    var token = await authRepository.authenticationAPI(
      email: email,
      password: password,
    );

    if (token != null) {
      var expires_in = parseJwt(token)['expires_in'].toString();
      UserSecureStorage().saveToken(token, expires_in);
      isAuthenticated.value = true;
      return true;
    } else {
      isAuthenticated.value = false;
      return false;
    }
  }

  Future<void> checkAuthentication() async {
    var token = await storage.getToken();
    if (token.isNotEmpty &&
        int.parse(token['expires_in']!) >
            DateTime.now().millisecondsSinceEpoch / 1000) {
      // print('Usuário autenticado!');
      isAuthenticated.value = true;
    } else {
      // print('Usuário não autenticado!');
      isAuthenticated.value = false;
    }
    isLoading.value = false;
  }
}

Map<String, dynamic> parseJwt(String token) {
  final parts = token.split('.');
  if (parts.length != 3) {
    throw Exception('Token inválido!');
  }

  final payload = _decodeBase64(parts[1]);
  final payloadMap = json.decode(payload);
  if (payloadMap is! Map<String, dynamic>) {
    throw Exception('Payload inválido!');
  }

  return payloadMap;
}

_decodeBase64(String str) {
  String output = str.replaceAll('-', '+').replaceAll('_', '/');

  switch (output.length % 4) {
    case 0:
      break;
    case 2:
      output += '==';
      break;
    case 3:
      output += '=';
      break;
    default:
      throw Exception('Illegal base64url string!"');
  }

  return utf8.decode(base64Url.decode(output));
}
