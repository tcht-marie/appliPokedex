import 'package:dio/dio.dart';
import 'package:poke/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final Dio dio;

  AuthenticationRepositoryImpl(this.dio);

  @override
  Future<void> login(String username, String password) async {
    Response response = await dio.post("/auth/login", data: '''{
        "username": "$username",
        "password": "$password"
            }''');
    if (response.statusCode == 200) {
    } else {
      throw Exception("Invalid credentials");
    }
  }

  @override
  Future<void> register(String username, String password) async {
    Response response = await dio.post("/auth/register", data: '''{
        "username": "$username",
        "password": "$password"
            }''');
    if (response.statusCode == 200) {
    } else {
      throw Exception("Try again");
    }
  }

  @override
  Future<void> logout() async {
    Response response = await dio.get("/logout");
    if (response.statusCode == 200) {
    } else {
      throw Exception("Try again");
    }
  }
}
