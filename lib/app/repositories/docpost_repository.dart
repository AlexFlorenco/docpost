import 'package:dio/dio.dart';

class DocpostRepository {
  final Dio dio;

  DocpostRepository({required this.dio});

  getDocpostBills() async {
    final result = await dio.get('api');

    // final List bills = [];

    if (result.statusCode == 200) {
      result.data.map(print('ok'));
    } else {
      print('Erro com a API');
    }
  }
}
