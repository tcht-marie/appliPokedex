
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke/config/providers.dart';

class AuthenticationNotifier extends AsyncNotifier<void> implements Listenable {

  final List<VoidCallback> _listeners = [];

  bool _isLoggedIn = false;

  // Indique si l'utilisateur est vu comme connecte dans l'application
  bool get isLoggedIn => _isLoggedIn;

  Future<bool> logout() async {
    if (_isLoggedIn == true) {
      bool logoutResult = await ref.read(authenticationServiceProvider).logout();
      if (logoutResult) {
        _isLoggedIn = false;
        for (var listener in _listeners) {
          listener();
        }
      }
      return logoutResult;
    }
    return true;
  }

  Future<bool> login(String username, String password) async {
    if (_isLoggedIn == false) {
      bool loginResult = await ref.read(authenticationServiceProvider).login(username, password);
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
    _listeners.add(listener);
  }

  @override
  FutureOr<void> build() {}

  @override
  void removeListener(VoidCallback listener) {
    _listeners.remove(listener);
  }
  
}