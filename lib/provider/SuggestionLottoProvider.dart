import 'package:flutter/material.dart';
import 'package:flutter_first/component/utils/HttpUtils.dart';
import 'dart:convert';

import '../model/Lotto.dart';

class SuggestionLottoProvider with ChangeNotifier {

//   List _historyGrade =List<int>.filled(6, 0);
   List _list = List<Lotto>.empty(growable:true);

   List get suggestionLotto => _list;

  void _requestSuggestionLottoList(String? type) async {

    var paramData = json.encode( { "keyWord": type, "filter" : { "pageIndex" : 0, "pageSize" : 100}});
    var response = await HttpUtils.post("/lotto-suggestion/list", paramData);

    _list = List<Lotto>.empty(growable:true);
    Map<String, dynamic> jsonData = jsonDecode(utf8.decode(response.bodyBytes));
    List<dynamic> lottoList = jsonData['data']['lists'];
     for(dynamic lotto in lottoList){
         _list.add(Lotto.fromJson(lotto));
     }
    notifyListeners();
  }

  void searchList(String type) {
    _requestSuggestionLottoList(type);
  }
}