import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_first/component/utils/HttpUtils.dart';
import 'package:http/http.dart';
import 'dart:convert';

import '../model/Lotto.dart';

class SuggestionLottoProvider with ChangeNotifier {

   List _list =List<Lotto>.empty(growable:true);
   int currentIndex = 0;
   bool isMore = false;

   String turn = "";
   String type = "";

   List get suggestionLotto => _list;
   int pageSize = 20;

  void requestSuggestionList(String turn, String type, bool add) async {

    if(!add){
      _list = List<Lotto>.empty(growable:true);
      currentIndex = 0;
    }

    var paramData = json.encode( {"turn" : turn, "keyWord": type, "filter" : { "pageIndex" : currentIndex, "pageSize" : pageSize}});
    var response = await HttpUtils.post("/lotto-suggestion/list", paramData);

    Map<String, dynamic> jsonData = jsonDecode(utf8.decode(response.bodyBytes));
    List<dynamic> lottoList = jsonData['data']['lists'];
    if(lottoList.isNotEmpty){
      for(dynamic lotto in lottoList){
        _list.add(Lotto.fromJson(lotto));
      }
      this.turn = turn;
      this.type = type;
      currentIndex = currentIndex + pageSize;
    }

    notifyListeners();
  }

  void _addItem() async{
    if (!isMore) {
      isMore = true;
      notifyListeners();

      Future.delayed(const Duration(milliseconds: 500), () {
        requestSuggestionList(turn, type, true);
        isMore = false;
        notifyListeners();
      });

      //var response = await HttpUtils.post("/lotto-suggestion/list", paramData);
    }
  }

   void listner(ScrollUpdateNotification notification) {
     if (notification.metrics.maxScrollExtent == notification.metrics.pixels) {
       _addItem();
     }
   }

  // void searchList(String turn, String type) {
  //   _requestSuggestionLottoList(turn, type);
  // }
}