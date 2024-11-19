import 'package:dio/dio.dart';
import 'package:poke/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final Dio dio;

  // constructeur qui initialise l'instance de Dio pour effectuer les requêtes HTTP
  AuthenticationRepositoryImpl(this.dio);

  @override
  Future<bool> login(String username, String password) async {
    // requête POST pour l'authentication
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

  @override
  Future<bool> register(String username, String password) async {
    // rquête POST pour enregistrer un user
    Response response = await dio.post("/auth/register", data: '''{
        "username": "$username",
        "password": "$password"
            }''');
    if (response.statusCode == 200) {
      return true; // enregistrement réussi
    } else {
      return false; // échec
    }
  }

  @override
  Future<bool> logout() async {
    // requête GET pour la déconnexion
    Response response = await dio.get("/logout");
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
