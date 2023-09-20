import 'package:flutter/material.dart';

class SignIn with ChangeNotifier {
  bool _isLogin = false;

  bool get isLogin => _isLogin;

  set isLogin(bool value) {
    _isLogin = value;
    notifyListeners();
  }
}