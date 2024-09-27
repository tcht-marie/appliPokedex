
import 'package:poke/domain/repositories/authentication_repository.dart';
import 'package:poke/domain/services/authentication_service.dart';

class AuthenticationServiceImpl implements AuthenticationService {
  final AuthenticationRepository authenticationRepository;

  AuthenticationServiceImpl(this.authenticationRepository);

  @override
  Future<void> login(String username, String password) {
    return authenticationRepository.login(username, password);
  }

  @override
  Future<void> logout() {
    return authenticationRepository.logout();
  }

  @override
  Future<void> register(String username, String password) {
    return authenticationRepository.register(username, password);
  }

}