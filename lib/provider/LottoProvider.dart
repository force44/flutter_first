import 'package:flutter/material.dart';
import 'dart:convert';
import '../klass/Lotto.dart';
import 'package:http/http.dart' as http;

class LottoProvider with ChangeNotifier {
  int _count = 0;
  int _numberSum = 0;
  int _turn = 0;
  String _oddAndEvenRate = "";
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
    var url = Uri.parse(
      'http://localhost:81/lotto-suggestion',
    );

    var paramData = json.encode( {"from" : form, "to" : to, "seed" : seed});
    var response = await http.post(
        url,
        headers: {"Content-Type": "application/json;charset=UTF-8"},
        body: paramData
    );

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    Lotto lotto = Lotto.fromJson(jsonData['data']);

    _lottoNumber = lotto.lottoNumbers;
    _countByWinNumbers = lotto.countByWinNumbers;
    _oddAndEvenRate = lotto.oddAndEvenRate;
    _numberSum = lotto.numberSum;
    _historyGrade = lotto.historyGrade;
    _transferNumber = lotto.transferNumber;
    _turn = lotto.turn;
    notifyListeners();
  }

  void _saveLotto() async {
    var url = Uri.parse(
      'http://localhost:81/lotto',
    );
    var paramData = json.encode({ "first" : _lottoNumber[0]
                                  , "second" : _lottoNumber[1]
                                  , "third" : _lottoNumber[2]
                                  , "fourth" : _lottoNumber[3]
                                  , "fifth" : _lottoNumber[4]
                                  , "sixth" : _lottoNumber[5]
                                  , "turn" : _turn
                                  , "type" : 'R'
    });

    await http.post(
        url,
        headers: {"Content-Type": "application/json;charset=UTF-8"},
        body: paramData
    );
    ++_count;

    notifyListeners();
  }

  void suggestionLotto(String seed, String form, String to) {

    print("$seed , $form, $to");
    _requestSuggestionLotto(seed, form, to);
  }

  void saveLotto() {
    _saveLotto();
  }

}