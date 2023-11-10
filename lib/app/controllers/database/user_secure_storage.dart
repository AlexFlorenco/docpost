import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage{
  final _storage = FlutterSecureStorage();

  saveToken(String token) async {
    await _storage.write(key: 'token', value: token);
  }
 
 getToken(){
  return _storage.read(key: 'token');
 }
}