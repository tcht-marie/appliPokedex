
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke/config/providers.dart';

// class qui gère l'état d'authentication du user
class AuthenticationNotifier extends AsyncNotifier<void> implements Listenable {

  // liste des écouteurs pour notifier les changements d'états
  final List<VoidCallback> _listeners = [];

  // état de connexion de base
  bool _isLoggedIn = false;

  // Indique si l'utilisateur est vu comme connecté dans l'application
  // GETTER pour vérifier si le user est connecté
  bool get isLoggedIn => _isLoggedIn;

  Future<bool> logout() async {
    // vérifie que le user est connecté
    if (_isLoggedIn == true) {
      // appelle le service pour déconnecter le user
      bool logoutResult = await ref.read(authenticationServiceProvider).logout();
      if (logoutResult) {
        // mis à jour de l'état de connexion si le logout est réussi
        _isLoggedIn = false;
        // notifie tous les écouteurs du changement d'état
        for (var listener in _listeners) {
          listener();
        }
      }
      // return le résultat du logout
      return logoutResult;
    }
    // si user non connecté, return true
    return true;
  }

  Future<bool> login(String username, String password) async {
    // vérifie que le user n'est pas connecté
    if (_isLoggedIn == false) {
      // appelle le service pour connecter le user
      bool loginResult = await ref.read(authenticationServiceProvider).login(username, password);
      // si la connexion réussit, met à jour l'état de connexion
      if (loginResult) {
        _isLoggedIn = true;
      }
      return loginResult;
    }
    return true;
  }

  Future<bool> register(String username, String password) {
    return ref.read(authenticationServiceProvider).register(username, password);
  }

  @override
  void addListener(VoidCallback listener) {
    _listeners.add(listener); // ajoute l'écouteur à la liste
  }

  // méthode requise par Listenable mais non utilisée
  @override
  FutureOr<void> build() {}

  @override
  void removeListener(VoidCallback listener) {
    _listeners.remove(listener); // retire l'écouteur de la liste
  }
  
}