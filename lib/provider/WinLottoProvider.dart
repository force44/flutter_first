import 'package:flutter/material.dart';
import 'package:flutter_first/component/utils/HttpUtils.dart';
import 'dart:convert';
import '../model/Lotto.dart';

class WinLottoProvider with ChangeNotifier {

  late Lotto _lotto;
  int _turn = 0;

  //Lotto get lotto => _lotto;

  Lotto get lotto => lotto;

  void _requestWinLotto() async {
    var response = await HttpUtils.get("/lotto", null);
    Map<String, dynamic> jsonData = jsonDecode(utf8.decode(response.bodyBytes));
    _lotto = Lotto.fromJson(jsonData['data']);

    notifyListeners();
  }

  void requestWinLotto() {
    _requestWinLotto();
  }
}