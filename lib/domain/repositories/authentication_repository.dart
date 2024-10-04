
abstract class AuthenticationRepository {

  Future<bool> register(String username, String password);

  Future<bool> login(String username, String password);

  Future<bool> logout();
}