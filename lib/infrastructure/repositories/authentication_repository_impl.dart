import 'package:dio/dio.dart';
import 'package:poke/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final Dio dio;

  AuthenticationRepositoryImpl(this.dio);

  @override
  Future<bool> login(String username, String password) async {
    Response response = await dio.post("/auth/login", data: '''{
        "username": "$username",
        "password": "$password"
            }''');
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> register(String username, String password) async {
    Response response = await dio.post("/auth/register", data: '''{
        "username": "$username",
        "password": "$password"
            }''');
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> logout() async {
    Response response = await dio.get("/logout");
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
