import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:poke/domain/repositories/authentication_repository.dart';
import 'package:poke/domain/repositories/pokemon_repository.dart';
import 'package:poke/domain/services/authentication_service.dart';
import 'package:poke/domain/services/authentication_service_impl.dart';
import 'package:poke/domain/services/pokemon_service.dart';
import 'package:poke/domain/services/pokemon_service_impl.dart';
import 'package:poke/infrastructure/repositories/authentication_repository_impl.dart';
import 'package:poke/infrastructure/repositories/mapper/pokemon_mapper.dart';
import 'package:poke/infrastructure/repositories/pokemon_repository_impl.dart';

final dioProvider = Provider<Dio>((ref) {
  final cookieJar = CookieJar();
  final dio = Dio(BaseOptions(baseUrl: 'http://localhost:8080'));
  dio.interceptors.add(CookieManager(cookieJar));
  return dio;
});

final _pokemonRepositoryProvider = Provider<PokemonRepository>((ref) {
  PokemonRepository pokemonRepository =
      PokemonRepositoryImpl(PokemonMapper(), ref.read(dioProvider));
  return pokemonRepository;
});

final pokemonServiceProvider = Provider<PokemonService>((ref) {
  PokemonService pokemonService =
      PokemonServiceImpl(ref.read(_pokemonRepositoryProvider));
  return pokemonService;
});

final _authRepositoryProvider = Provider<AuthenticationRepository>((ref) {
  AuthenticationRepository authenticationRepository =
      AuthenticationRepositoryImpl(ref.read(dioProvider));
  return authenticationRepository;
});

final authenticationServiceProvider = Provider<AuthenticationService>((ref) {
  AuthenticationService authenticationService =
      AuthenticationServiceImpl(ref.read(_authRepositoryProvider));
  return authenticationService;
});