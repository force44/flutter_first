import 'package:flutter/material.dart';
import 'dart:convert';
import '../klass/Lotto.dart';
import 'package:http/http.dart' as http;

class TestProvider with ChangeNotifier {
  int _count = 0;
  List _lottoNumber =List<int>.filled(6, 0);

  int get count => _count;

  List get lottoNumber => _lottoNumber;


  void _callAPI() async {
    var url = Uri.parse(
      'http://localhost:81/lotto-suggestion',
    );

    var paramData = json.encode( {"from" : 1, "to" : 2, "seed" : 7});
    var response = await http.post(
        url,
        headers: {"Content-Type": "application/json;charset=UTF-8"},
        body: paramData
    );

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    Lotto lotto = Lotto.fromJson(jsonData['data']);

    _lottoNumber = lotto.lottoNumber;

  }

  void increase() {
    ++_count;
    _callAPI();
    notifyListeners();
  }

  void decrease() {
    --_count;
    notifyListeners();
  }
}