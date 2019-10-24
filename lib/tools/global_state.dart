import 'package:flutter/material.dart';

class GlobalModel with ChangeNotifier {
  bool _hasLogin = false;
  bool get value => _hasLogin;

  void goLogin(){
    _hasLogin = !_hasLogin;
    notifyListeners();
  }
}