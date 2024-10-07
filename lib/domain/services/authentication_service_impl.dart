
import 'package:poke/domain/repositories/authentication_repository.dart';
import 'package:poke/domain/services/authentication_service.dart';

class AuthenticationServiceImpl implements AuthenticationService {
  final AuthenticationRepository authenticationRepository;

  AuthenticationServiceImpl(this.authenticationRepository);

  bool isLoggedIn = false;

  @override
  Future<bool> login(String username, String password) {
    return authenticationRepository.login(username, password);
  }

  @override
  Future<bool> logout() {
    return authenticationRepository.logout();
  }

  @override
  Future<bool> register(String username, String password) {
    return authenticationRepository.register(username, password);
  }

}