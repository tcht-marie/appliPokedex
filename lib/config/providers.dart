import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke/domain/repositories/authentication_repository.dart';
import 'package:poke/domain/repositories/pokemon_repository.dart';
import 'package:poke/domain/services/authentication_service.dart';
import 'package:poke/domain/services/authentication_service_impl.dart';
import 'package:poke/domain/services/pokemon_service.dart';
import 'package:poke/domain/services/pokemon_service_impl.dart';
import 'package:poke/infrastructure/repositories/authentication_repository_impl.dart';
import 'package:poke/infrastructure/repositories/mapper/pokemon_mapper.dart';
import 'package:poke/infrastructure/repositories/pokemon_repository_impl.dart';

import '../notifier/authentication_notifier.dart';

// provider == singleton
// donc provider instancier qu'une fois ici mais dispo par injection (grâce à ref) partout où j'en ai besoin

/// Provider pour DIO avec CookieJar pour stocker les cookies,
/// définiton d'une url de base pour les requêtes et validation des statuts des réponses
final dioProvider = Provider<Dio>((ref) {
  final cookieJar = CookieJar();
  final dio = Dio(BaseOptions(
      baseUrl: 'http://localhost:8080', validateStatus: (status) => true));
  // ajout du gestionnaire de cookies à dio
  dio.interceptors.add(CookieManager(cookieJar));
  return dio;
});

/// Provider privé qui instancie le Dio Provider
final _pokemonRepositoryProvider = Provider<PokemonRepository>((ref) {
  PokemonRepository pokemonRepository =
      PokemonRepositoryImpl(PokemonMapper(), ref.read(dioProvider));
  return pokemonRepository;
});

/// Provider privé qui instancie le Dio Provider
final _authRepositoryProvider = Provider<AuthenticationRepository>((ref) {
  AuthenticationRepository authenticationRepository =
      AuthenticationRepositoryImpl(ref.read(dioProvider));
  return authenticationRepository;
});

/// Instancie le pokemonRepositoryImpl
final pokemonServiceProvider = Provider<PokemonService>((ref) {
  PokemonService pokemonService =
      PokemonServiceImpl(ref.read(_pokemonRepositoryProvider));
  return pokemonService;
});

/// Instancie le AuthenticationRepositoryImpl
final authenticationServiceProvider = Provider<AuthenticationService>((ref) {
  AuthenticationService authenticationService =
      AuthenticationServiceImpl(ref.read(_authRepositoryProvider));
  return authenticationService;
});

/// Expose un notifier asynchrone qui gère l'état d'authentification de l'utilisateur
final authenticationNotifierProvider =
    AsyncNotifierProvider<AuthenticationNotifier, void>(
        AuthenticationNotifier.new);
