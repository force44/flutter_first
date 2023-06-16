import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_first/provider/WinLottoProvider.dart';
import 'package:provider/provider.dart';

import '../component/number/ColorNumber.dart';
import '../component/utils/HttpUtils.dart';
import '../model/Lotto.dart';

class TabHome extends StatelessWidget{


  Future _future() async {
    var response = await HttpUtils.get("/lotto", null);
    Map<String, dynamic> jsonData = jsonDecode(utf8.decode(response.bodyBytes));
    Lotto lotto = Lotto.fromJson(jsonData['data']);
    return  _WinStatWidget(lotto); // 5초 후 '짜잔!' 리턴
  }


  Widget _WinStatWidget(Lotto lotto){

    List<Expanded> numbers = [];
    numbers.add(_layOutNumber(lotto.first));
    numbers.add(_layOutNumber(lotto.second));
    numbers.add(_layOutNumber(lotto.third));
    numbers.add(_layOutNumber(lotto.fourth));
    numbers.add(_layOutNumber(lotto.fifth));
    numbers.add(_layOutNumber(lotto.sixth));
   // numbers.add(_layOutNumber(lotto.bo));

    return Column(
      children: [
                Row( 
                    children: [
                      Text("${lotto.turn} 회"),
                      Text(" 당첨번호")
                    ]
                ),
                Text("( ${lotto.regDt} )"),
                Row(
                    children: numbers
                ),
      ],
      
    );
  }

  Expanded _layOutNumber(int number){
    String numberTxt = number.toString();
    if(number < 10) {
      numberTxt = "0$numberTxt";      // 일의 자리는 0을 붙여 준다.
    }
    return
      Expanded(
          flex: 1,
          child:
          Container(
              margin: const EdgeInsets.all(4.0),
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: ColorNumber.getColorOfNumber(number),
                borderRadius: BorderRadius.circular(360),
              ),
              child: Text(numberTxt, style: const TextStyle(fontWeight:FontWeight.w400, fontSize: 12), textAlign:TextAlign.center)
          )
      );
  }

  @override
  Widget build(BuildContext context) {




    return ChangeNotifierProvider(
             create: (BuildContext context) => WinLottoProvider(),
             child :  Column(
                 children: [
                   Container(
                     margin: const EdgeInsets.all(10.0),
                     padding: const EdgeInsets.all(10.0),
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(10),
                       border: Border.all(color: Colors.black12, width: 1),
                       boxShadow: [
                         BoxShadow(
                           color: Colors.grey.withOpacity(0.5),
                           spreadRadius: 1,
                           blurRadius: 4,
                           offset: Offset(0, 3), // changes position of shadow
                         ),
                       ],
                     ),
                     child: Row(
                       children:  [
                         Expanded(
                             flex: 1,
                             child: Column(
                                 children: [
                                   Container(
                                       margin: const EdgeInsets.all(1.0),
                                       child: Text("★Luck★")),
                                   Container(
                                       margin: const EdgeInsets.all(1.0),
                                       child: Text("1002", style: TextStyle(fontWeight:FontWeight.w700))),
                                   Container(
                                       width : 40,
                                       margin: const EdgeInsets.all(1.0),
                                       color: Colors.yellow.shade100,
                                       child: Center( child: Text("10", style: TextStyle(color: Colors.orange))))
                                 ]
                             )
                         ),
                         Expanded(
                             flex: 1,
                             child: Column(
                                 children: [
                                   Container(
                                       margin: const EdgeInsets.all(1.0),
                                       child: Text("Save")),
                                   Container(
                                       margin: const EdgeInsets.all(1.0),
                                       child: Text("520", style: TextStyle(fontWeight:FontWeight.w700))),
                                   Container(
                                       width : 60,
                                       margin: const EdgeInsets.all(1.0),
                                       color: Colors.yellow.shade100,
                                       child: Center( child: Text("9", style: TextStyle(color: Colors.orange))))
                                 ]
                             )
                         )
                         ,
                         Expanded(
                             flex: 1,
                             child: Column(
                                 children: [
                                   Container(
                                       margin: const EdgeInsets.all(1.0),
                                       child: Text("1072회")),
                                   Container(
                                       margin: const EdgeInsets.all(1.0),
                                       child: Text("40", style: TextStyle(fontWeight:FontWeight.w700))),
                                   Container(
                                       width : 40,
                                       margin: const EdgeInsets.all(1.0),
                                       color: Colors.yellow,
                                       child: Center( child: Text("??", style: TextStyle(color: Colors.orange))))
                                 ]
                             )
                         )
                       ],
                     ),
                   ),
                   Container(
                     margin: const EdgeInsets.all(10.0),
                     padding: const EdgeInsets.all(10.0),
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(10),
                       border: Border.all(color: Colors.black12, width: 1),
                       boxShadow: [
                         BoxShadow(
                           color: Colors.grey.withOpacity(0.5),
                           spreadRadius: 1,
                           blurRadius: 4,
                           offset: Offset(0, 3), // changes position of shadow
                         ),
                       ],
                     ),
                     child:    FutureBuilder(
                         future: _future(),
                         builder: (BuildContext context, AsyncSnapshot snapshot) {
                           //해당 부분은 data를 아직 받아 오지 못했을 때 실행되는 부분
                           if (snapshot.hasData == false) {
                             return CircularProgressIndicator(); // CircularProgressIndicator : 로딩 에니메이션
                           }

                           //error가 발생하게 될 경우 반환하게 되는 부분
                           else if (snapshot.hasError) {
                             return Padding(
                               padding: const EdgeInsets.all(8.0),

                               child: Text(
                                 'Error: ${snapshot.error}', // 에러명을 텍스트에 뿌려줌
                                 style: TextStyle(fontSize: 15),
                               ),
                             );
                           }

                           // 데이터를 정상적으로 받아오게 되면 다음 부분을 실행하게 되는 부분
                           else {
                             return Padding(
                               padding: const EdgeInsets.all(8.0),

                               child: snapshot.data
                             );
                           }
                         })

                   )

                 ]
             )
      );

  }
}