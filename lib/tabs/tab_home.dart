import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_first/provider/LoginProvider.dart';
import 'package:flutter_first/provider/WinLottoProvider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

import '../component/number/ColorNumber.dart';
import '../component/utils/HttpUtils.dart';
import '../model/Login.dart';
import '../model/Lotto.dart';


class TabHome extends StatefulWidget {
  const TabHome({super.key});

  @override
  _TabHome createState() => _TabHome();
}

class _TabHome extends State<TabHome> {


  static final storage = FlutterSecureStorage();


  Future _future() async {
    var response = await HttpUtils.get("/lotto", null);
    Map<String, dynamic> jsonData = jsonDecode(utf8.decode(response.bodyBytes));
    Lotto lotto = Lotto.fromJson(jsonData['data']);
    return  winStatWidget(lotto);
  }

  Widget winStatWidget(Lotto lotto){
    List<Expanded> numbers = [];
    numbers.add(_layOutNumber(lotto.first));
    numbers.add(_layOutNumber(lotto.second));
    numbers.add(_layOutNumber(lotto.third));
    numbers.add(_layOutNumber(lotto.fourth));
    numbers.add(_layOutNumber(lotto.fifth));
    numbers.add(_layOutNumber(lotto.sixth));
    numbers.add(_layOutPlus());
    numbers.add(_layOutNumber(lotto.bonus));

    var summary = lotto.lottoSummary;

    return Column(
            children: [
                      Row(
                          children: [
                            Text("${lotto.turn} 회 ", style: TextStyle(fontWeight:FontWeight.w900, fontSize: 20, color: Colors.blueAccent)),
                            Text("당첨번호" , style: TextStyle(fontWeight:FontWeight.w900, fontSize: 16, color: Colors.grey))
                          ]
                      ),
                      Text("( ${lotto.regDt} )"),
                      Container(
                        margin: const EdgeInsets.fromLTRB(1, 10, 1, 10),
                        //padding: const EdgeInsets.all(5.0),
                        child: Row(
                            children: numbers
                        ),
                      ),
                      Row(
                          children: [
                            SizedBox(
                              width: 110,
                              child: Text("1등 (${summary.firstWinners}명)"),
                            ),
                            SizedBox(
                              width: 110,
                              child: Text(" ${summary.firstAmount}원" ,style: TextStyle(fontWeight:FontWeight.w900,  color: Colors.redAccent), textAlign: TextAlign.right)
                            ),

                          ]
                      ),
                      Row(
                          children: [
                            SizedBox(
                              width: 110,
                              child: Text("2등 (${summary.secondWinners}명)"),
                            ),
                            SizedBox(
                              width: 110,
                              child: Text(" ${summary.secondAmount}원" ,style: TextStyle(fontWeight:FontWeight.w500,  color: Colors.blueAccent), textAlign: TextAlign.right)
                            )
                          ]
                      ),
                      Row(
                          children: [
                            SizedBox(
                              width: 110,
                              child: Text("3등 (${summary.thirdWinners}명)"),
                            ),
                            SizedBox(
                              width: 110,
                              child:
                              Text(" ${summary.thirdAmount}원" ,style: TextStyle(fontWeight:FontWeight.w500,  color: Colors.blueGrey),  textAlign: TextAlign.right)
                            )
                          ]
                      ),
                      Row(
                          children: [
                            SizedBox(
                              width: 110,
                              child: Text("4등 (${summary.fourthWinners}명)"),
                            ),
                            SizedBox(
                              width: 110,
                              child: Text("50,000원" ,style: TextStyle(fontWeight:FontWeight.w500,  color: Colors.blueGrey),  textAlign: TextAlign.right)
                            )
                          ]
                      ),
                        Row(
                            children: [
                              SizedBox(
                                width: 110,
                                child: Text("5등 (${summary.fifthWinners}명)"),
                              ),
                              SizedBox(
                                width: 110,
                                child: Text("5,000원" ,style: TextStyle(fontWeight:FontWeight.w500,  color: Colors.blueGrey), textAlign: TextAlign.right)
                              )
                            ]
                        )
            ]
    );
  }

  Expanded _layOutPlus(){
    return
      Expanded(
          flex: 1,
          child:
          Container(
              margin: const EdgeInsets.all(2.0),
              padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
              height: 35,
              // decoration: BoxDecoration(
              //   color: ColorNumber.getColorOfNumber(number),
              //   borderRadius: BorderRadius.circular(360),
              // ),
              child: Text("+", style: TextStyle(fontWeight:FontWeight.w900, fontSize: 20, color: Colors.grey), textAlign:TextAlign.center)
          )
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
              margin: const EdgeInsets.all(2.0),
             // padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
             padding: const EdgeInsets.all(6),
              height: 35,
              decoration: BoxDecoration(
                color: ColorNumber.getColorOfNumber(number),
                borderRadius: BorderRadius.circular(360),
              ),
              child: Text(numberTxt, style: TextStyle(fontWeight:FontWeight.w900, fontSize: 20, color: Colors.white70), textAlign:TextAlign.center)
          )
      );
  }



  Future _getNickName() async{
    String? nickName = await storage.read(key: '_nickName');
    return Column(
      children:  [
        SizedBox(
            width: double.infinity,
            child: Text( "$nickName 님, "
                , style: TextStyle(fontWeight:FontWeight.w900, fontSize: 18, color: Colors.grey)
                , textAlign: TextAlign.left)
        ),
        SizedBox(
            width: double.infinity,
            child: Text( "로또 당첨을 기원드립니다."
                , style: TextStyle(fontWeight:FontWeight.w600, fontSize: 16, color: Colors.orangeAccent)
                , textAlign: TextAlign.left)
        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();

    // 비동기로 flutter secure storage 정보를 불러오는 작업
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   _userInfo();
    // });
  }


  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
             create: (BuildContext context) => WinLottoProvider(),
             child :  Column(
                         children: [
                           Container(
                               margin: const EdgeInsets.fromLTRB(15, 10, 0, 5),
                               width: double.infinity,
                               child:  FutureBuilder(
                                   future: _getNickName(),
                                   builder: (BuildContext context, AsyncSnapshot snapshot) {
                                     return Padding(
                                         padding: const EdgeInsets.all(8.0),
                                         child: snapshot.data
                                     );
                                   })
                           ),


                           Container(
                             margin: const EdgeInsets.fromLTRB(10, 5, 10, 10),
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
                                               child: Text("올해 누적")),
                                           Container(
                                               margin: const EdgeInsets.all(1.0),
                                               child: Text("1002", style: TextStyle(fontWeight:FontWeight.w700))),
                                           Container(
                                               margin: const EdgeInsets.all(1.0),
                                               color: Colors.yellow.shade100,
                                               child: Center( child: Text("52", style: TextStyle(color: Colors.orange))))
                                         ]
                                     )
                                 ),
                                 Expanded(
                                     flex: 1,
                                     child: Column(
                                         children: [
                                           Container(
                                               margin: const EdgeInsets.all(1.0),
                                               child: Text("회차 추천")),
                                           Container(
                                               margin: const EdgeInsets.all(1.0),
                                               child: Text("30", style: TextStyle(fontWeight:FontWeight.w700))),
                                           Container(
                                               margin: const EdgeInsets.all(1.0),
                                               color: Colors.yellow.shade100,
                                               child: Center( child: Text("5", style: TextStyle(color: Colors.orange))))
                                         ]
                                     )
                                 ),
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