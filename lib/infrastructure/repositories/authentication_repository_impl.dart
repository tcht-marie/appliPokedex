import 'package:dio/dio.dart';
import 'package:poke/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final Dio dio;

  // constructeur qui initialise l'instance de Dio pour effectuer les requêtes HTTP
  AuthenticationRepositoryImpl(this.dio);

  /// Requête POST pour connecter un utilisateur
  @override
  Future<bool> login(String username, String password) async {
    Response response = await dio.post("/auth/login", data: '''{
        "username": "$username",
        "password": "$password"
            }''');
    if (response.statusCode == 200) {
      return true; // connexion réussie
    } else {
      return false; // échec de la connexion
    }
  }

  /// Requête POST pour enregister un utilisateur
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

  /// Requête GET pour déconnecter un utilisateur
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
