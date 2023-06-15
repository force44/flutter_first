import 'package:flutter/material.dart';
import '../model/Login.dart';

class LoginProvider with ChangeNotifier {
  late Login _loginInfo;

  String get loginID => _loginInfo.loginId;
  String get nickName => _loginInfo.nickName;
  String get password => _loginInfo.password;
  String get token => _loginInfo.token;

  void _login(Login loginInfo)  async {
    _loginInfo = loginInfo;
    print(_loginInfo);
    notifyListeners();
  }

  void login(Login loginInfo) {
    _login(loginInfo);
  }
}