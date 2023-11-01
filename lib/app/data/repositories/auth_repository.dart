import 'package:dio/dio.dart';

class AuthRepository {
  final Dio dio = Dio();
  String email;
  String password;

  AuthRepository({
    required this.email,
    required this.password,
  });

  authentication() async {
    try {
      var response =
          await dio.post('https://docpost-mvp.onrender.com/api/login', data: {
        'email': email,
        'senha': password,
      });
      if (response.statusCode == 200) {
        print('Login bem sucedido!');
        print(response.data);
      }
    } catch (e) {
      print('Erro no login!');
    }
  }
}
