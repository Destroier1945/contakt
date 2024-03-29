import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;

  bool isLoading = true;

  AuthService() {
    _authCheck();
  }
  _authCheck() {
    _auth.authStateChanges().listen((User? user) {
      user = (user == null) ? user : user;
      isLoading = false;

      notifyListeners();
    });
  }
}
