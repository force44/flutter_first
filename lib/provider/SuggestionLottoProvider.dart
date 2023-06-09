import 'package:flutter/material.dart';
import 'dart:convert';
import '../component/utils/Constant.dart';
import 'package:http/http.dart' as http;

class SuggestionLottoProvider with ChangeNotifier {

  void _requestSuggestionLottoList() async {
    var url = Uri.parse(
      'http://localhost:81/lotto-suggestion/list',
    );

    var paramData = json.encode( {"filter" : { "pageIndex" : 0, "pageSize" : 10}});
    var response = await http.post(
        url,
        headers: Constant.httpHeaders,
        body: paramData
    );

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    print( jsonData);
    //Lotto lotto = Lotto.fromJson(jsonData['data']);
    notifyListeners();
  }

  void searchList(String turn) {
    _requestSuggestionLottoList();
  }
}