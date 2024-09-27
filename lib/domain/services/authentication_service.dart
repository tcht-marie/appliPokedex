
abstract class AuthenticationService {
  Future<void> register(String username, String password);

  Future<void> login(String username, String password);

  Future<void> logout();
}