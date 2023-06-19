import 'package:flutter/material.dart';
import 'dart:convert';
import '../component/utils/HttpUtils.dart';
import '../model/LottoStat.dart';

class LottoStatProvider with ChangeNotifier {
  int _count = 0;
  int _numberSum = 0;
  int _turn = 0;

  double _lottoId = 0;

  String _oddAndEvenRate = " 0 : 0";
  String _transferNumber = "0";
  List _lottoNumber =List<int>.filled(6, 0);
  List _countByWinNumbers =List<int>.filled(6, 0);
  List _historyGrade =List<int>.filled(6, 0);

  int get count => _count;
  int get numberSum => _numberSum;
  String get oddAndEvenRate => _oddAndEvenRate;
  String get transferNumber => _transferNumber;
  List get lottoNumber => _lottoNumber;
  List get countByWinNumbers => _countByWinNumbers;
  List get historyGrade => _historyGrade;

  void _requestSuggestionLotto(String seed, String form, String to) async {

    var paramData = json.encode( {"from" : form, "to" : to, "seed" : seed});
    var response = await HttpUtils.post("/lotto-suggestion", paramData);

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    LottoStat lotto = LottoStat.fromJson(jsonData['data']);

    _lottoNumber = lotto.lottoNumbers;
    _countByWinNumbers = lotto.countByWinNumbers;
    _oddAndEvenRate = lotto.oddAndEvenRate;
    _numberSum = lotto.numberSum;
    _historyGrade = lotto.historyGrade;
    _transferNumber = lotto.transferNumber;
    _turn = lotto.turn;
    _lottoId = lotto.lottoId;
    notifyListeners();
  }

  void _saveLotto() async {
    var paramData = json.encode({ "id" :_lottoId});

    HttpUtils.post("/lotto", paramData);
    ++_count;
    notifyListeners();
  }

  void suggestionLotto(String from, String to, String seed) {
    _requestSuggestionLotto(seed, from, to);
  }

  void saveLotto() {
    _saveLotto();
  }
}