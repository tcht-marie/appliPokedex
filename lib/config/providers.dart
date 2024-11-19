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

import '../notifier/authentication_notifier.dart';

// provider == singleton
// donc provider instancier qu'une fois ici mais dispo par injection (grâce à ref) partout où j'en ai besoin

// création d'un fournisseur pour dio
final dioProvider = Provider<Dio>((ref) {
  // création d'un cookiejar pour stocker les cookies
  final cookieJar = CookieJar();
  // définition de l'url de base pour les requêtes
  final dio = Dio(BaseOptions(
    // avec validation de tous les statuts de réponses
      baseUrl: 'http://localhost:8080', validateStatus: (status) => true));
  // ajout du gestionnaire de cookies à dio
  dio.interceptors.add(CookieManager(cookieJar));
  // return l'instance de dio configurée
  return dio;
});


// fournisseurs définis pour les reop pokemon et authentication qui instancient les implémentations correspondantes avec les dépendances nécessaires
final _pokemonRepositoryProvider = Provider<PokemonRepository>((ref) {
  PokemonRepository pokemonRepository =
      PokemonRepositoryImpl(PokemonMapper(), ref.read(dioProvider));
  return pokemonRepository;
});

final _authRepositoryProvider = Provider<AuthenticationRepository>((ref) {
  AuthenticationRepository authenticationRepository =
      AuthenticationRepositoryImpl(ref.read(dioProvider));
  return authenticationRepository;
});

// fournisseurs définis pour les services pokémon et authentication reliant les services aux repo
final pokemonServiceProvider = Provider<PokemonService>((ref) {
  PokemonService pokemonService =
  PokemonServiceImpl(ref.read(_pokemonRepositoryProvider));
  return pokemonService;
});

final authenticationServiceProvider = Provider<AuthenticationService>((ref) {
  AuthenticationService authenticationService =
      AuthenticationServiceImpl(ref.read(_authRepositoryProvider));
  return authenticationService;
});

// fournisseur créé permettant de gérer l'état d'authentication du user
final authenticationNotifierProvider =
    AsyncNotifierProvider<AuthenticationNotifier, void>(
        AuthenticationNotifier.new);
