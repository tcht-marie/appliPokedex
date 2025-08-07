import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke/config/providers.dart';

/// Classe qui gère l'état d'authentication du user et coordonne les appels
class AuthenticationNotifier extends AsyncNotifier<void> implements Listenable {
  final List<VoidCallback> _listeners = []; // liste des écouteurs

  bool _isLoggedIn = false; // état de connexion de base

  // getter pour consulter l'état d'auth d'un user
  bool get isLoggedIn => _isLoggedIn;

  Future<bool> logout() async {
    // vérifie que le user est connecté
    if (_isLoggedIn == true) {
      bool logoutResult =
          await ref.read(authenticationServiceProvider).logout();
      if (logoutResult) {
        // mis à jour de l'état de connexion si le logout est réussi
        _isLoggedIn = false;
        // notifie tous les écouteurs du changement d'état
        for (var listener in _listeners) {
          listener();
        }
      }
      return logoutResult;
    }
    return true; // si user non connecté
  }

  Future<bool> login(String username, String password) async {
    // vérifie que le user n'est pas connecté
    if (_isLoggedIn == false) {
      // appelle le service pour connecter le user
      bool loginResult = await ref
          .read(authenticationServiceProvider)
          .login(username, password);
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
    _listeners.add(listener); // ajoute un écouteur à la liste
  }

  // méthode requise par Listenable mais non utilisée
  @override
  FutureOr<void> build() {}

  @override
  void removeListener(VoidCallback listener) {
    _listeners.remove(listener); // retire un écouteur de la liste
  }
}
