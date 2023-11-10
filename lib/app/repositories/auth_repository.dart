import 'package:dio/dio.dart';

class AuthRepository {
  final Dio dio = Dio();

  AuthRepository();

  Future<String?> authenticationAPI(
      {required String email, required String password}) async {
    try {
      var response =
          await dio.post('https://docpost-mvp.onrender.com/api/login', data: {
        'email': email,
        'senha': password,
      });
      if (response.statusCode == 200) {
        // print('Token: ' + response.data['response']['accessToken']);
        return (response.data['response']['accessToken']);
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}
