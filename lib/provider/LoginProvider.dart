import 'package:flutter/material.dart';
import 'dart:convert';
import '../component/utils/Constant.dart';
import '../model/Login.dart';
import 'package:http/http.dart' as http;

class LoginProvider with ChangeNotifier {
  //int _id = 0;
  late Login _loginInfo;

  String get loginID => _loginInfo.loginID;
  String get nickName => _loginInfo.nickName;
  String get password => _loginInfo.password;

  void _login(String id, String password) async {
    var url = Uri.parse(
       "${Constant.url}/login",
    );

    var paramData = json.encode( {"loginId" : id, "password" : password});
    var response = await http.post(
        url,
        headers: Constant.httpHeaders,
        body: paramData
    );

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    print(jsonData);
    _loginInfo = Login.fromJson(jsonData['data']);
    notifyListeners();
  }

  void login(String id, String password) {
    print( "$id , $password");
    _login(id, password);
  }
}