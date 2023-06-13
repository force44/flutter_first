import 'package:flutter/material.dart';
import 'dart:convert';
import '../component/utils/Constant.dart';
import 'package:http/http.dart' as http;

import '../klass/Lotto.dart';

class SuggestionLottoProvider with ChangeNotifier {

//   List _historyGrade =List<int>.filled(6, 0);
   List _list = List<Lotto>.empty(growable:true);

   List get suggestionLotto => _list;

  void _requestSuggestionLottoList(String? type) async {
    var url = Uri.parse(
        "${Constant.url}/lotto-suggestion/list",
    );

    var paramData = json.encode( { "keyWord": type, "filter" : { "pageIndex" : 0, "pageSize" : 100}});
    var response = await http.post(
        url,
        headers: Constant.httpHeaders,
        body: paramData
    );

    _list = List<Lotto>.empty(growable:true);
    Map<String, dynamic> jsonData = jsonDecode(utf8.decode(response.bodyBytes));
    List<dynamic> lottoList = jsonData['data']['lists'];
    //print(lottoList);
     for(dynamic lotto in lottoList){
         _list.add(Lotto.fromJson(lotto));
     }
    notifyListeners();
  }

  void searchList(String type) {
    _requestSuggestionLottoList(type);
  }
}