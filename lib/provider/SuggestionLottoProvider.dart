import 'package:flutter/material.dart';
import 'dart:convert';
import '../component/utils/Constant.dart';
import 'package:http/http.dart' as http;

import '../klass/Lotto.dart';

class SuggestionLottoProvider with ChangeNotifier {

//   List _historyGrade =List<int>.filled(6, 0);
   List _list = List<Lotto>.empty(growable:true);

   List get suggestionLotto => _list;

  void _requestSuggestionLottoList() async {
    var url = Uri.parse(
      'http://localhost:81/lotto-suggestion/list',
    );

    var paramData = json.encode( {"filter" : { "pageIndex" : 0, "pageSize" : 100}});
    var response = await http.post(
        url,
        headers: Constant.httpHeaders,
        body: paramData
    );


    _list = List<Lotto>.empty(growable:true);
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    List<dynamic> jj = jsonData['data']['lists'];
     for(dynamic lotto in jj){
         _list.add(Lotto.fromJson(lotto));
     }
     print(_list);
    //Lotto lotto = Lotto.fromJson(jsonData['data']);
    notifyListeners();
  }

  void searchList(String turn) {
    _requestSuggestionLottoList();
  }
}