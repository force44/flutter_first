import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_first/provider/WinLottoProvider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

import '../component/number/ColorNumber.dart';
import '../component/utils/HttpUtils.dart';
import '../model/Lotto.dart';


class TabHome extends StatefulWidget {
  const TabHome({super.key});

  @override
  _TabHome createState() => _TabHome();
}

class _TabHome extends State<TabHome> {

  static final storage = FlutterSecureStorage();


  Future _winLotto() async {
    var response = await HttpUtils.get("/lotto", null);
    Map<String, dynamic> jsonData = jsonDecode(utf8.decode(response.bodyBytes));
    Lotto lotto = Lotto.fromJson(jsonData['data']);

    await storage.write(key: '_turn', value: (lotto.turn + 1).toString());
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
                            Text("${lotto.turn}회 ", style: TextStyle(fontWeight:FontWeight.w900, fontSize: 20, color: Colors.blueAccent)),
                            Text("당첨번호" , style: TextStyle(fontWeight:FontWeight.w900, fontSize: 20, color: Colors.grey))
                          ]
                      ),
                      Text("( ${lotto.regDt} )"),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        height: 40,
                        //padding: const EdgeInsets.all(5.0),
                        child: Row(
                            children: numbers
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                                children: [
                                  Expanded( flex: 1, child: Text("1등(${summary.firstWinners}명)" , textAlign: TextAlign.left) ),
                                  Expanded( flex: 2, child: Text("${summary.firstAmount}원" ,style: TextStyle(fontWeight:FontWeight.w900,  color: Colors.redAccent), textAlign: TextAlign.right) )
                                ],
                              )
                      ),

                      SizedBox(
                          width: double.infinity,
                          child: Row(
                            children: [
                              Expanded( flex: 1, child: Text("2등(${summary.secondWinners}명)" , textAlign: TextAlign.left) ),
                              Expanded( flex: 2, child: Text("${summary.secondAmount}원" ,style: TextStyle(fontWeight:FontWeight.w900,  color: Colors.orangeAccent), textAlign: TextAlign.right) )
                            ],
                          )
                      ),

                      SizedBox(
                          width: double.infinity,
                          child: Row(
                            children: [
                              Expanded( flex: 1, child: Text("3등(${summary.thirdWinners}명)" , textAlign: TextAlign.left) ),
                              Expanded( flex: 2, child: Text("${summary.thirdAmount}원" ,style: TextStyle(fontWeight:FontWeight.w900,  color: Colors.blueAccent), textAlign: TextAlign.right) )
                            ],
                          )
                      ),


            ]
    );
  }

  Expanded _layOutPlus(){
    return
      Expanded(
          flex: 1,
          child:
          SizedBox(
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
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              height: 40,
              decoration: BoxDecoration(
                color: ColorNumber.getColorOfNumber(number),
                borderRadius: BorderRadius.circular(360),
              ),
              child: Text(numberTxt, style: TextStyle(fontWeight:FontWeight.w700, fontSize: 12, color: Colors.white70), textAlign:TextAlign.center)
          )
      );
  }

  Future _getNickname() async{
    return await storage.read(key: '_nickname');
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
                               margin: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                               width: double.infinity,
                               child:  FutureBuilder(
                                   future: _getNickname(),
                                   builder: (BuildContext context, AsyncSnapshot snapshot) {
                                     return Padding(
                                         padding: const EdgeInsets.all(8.0),
                                         child: Column(
                                                   children:  [
                                                       SizedBox(
                                                       width: double.infinity,
                                                           child: Text( "${snapshot.data} 님, "
                                                               , style: TextStyle(fontWeight:FontWeight.w900, fontSize: 18, color: Colors.grey)
                                                               , textAlign: TextAlign.left)
                                                       )
                                                     ,  SizedBox(
                                                         width: double.infinity,
                                                         child: Text( "로또 당첨을 기원드립니다."
                                                             , style: TextStyle(fontWeight:FontWeight.w600, fontSize: 16, color: Colors.orangeAccent)
                                                             , textAlign: TextAlign.left)
                                                      )
                                                   ])
                                     );
                                   })
                           ),


                           Container(
                            margin: const EdgeInsets.all(10.0),
                            padding: const EdgeInsets.all(10.0),
                            width: double.infinity,
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
                                 future: _winLotto(),
                                 builder: (BuildContext context, AsyncSnapshot snapshot) {
                                   //해당 부분은 data를 아직 받아 오지 못했을 때 실행되는 부분
                                   if (snapshot.hasData == false) {
                                     return  Center(
                                         child: CircularProgressIndicator()
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
                           ),

                           //TODO
                           Container(
                               margin: const EdgeInsets.fromLTRB(10, 12, 10, 12),
                               padding: const EdgeInsets.fromLTRB(10, 12, 10, 12),
                               decoration: BoxDecoration(
                                 color: Colors.white,
                                 borderRadius: BorderRadius.circular(10),
                                 border: Border.all(color: Colors.black12, width: 1),
                               ),
                               child: Center(
                                   child: Row(
                                     children: [
                                       Expanded(
                                           flex: 1,
                                           child : Row ( children: [
                                             Text("홀짝 : " , style: TextStyle(fontWeight:FontWeight.w800), textAlign:TextAlign.center),
                                             Text(" 0 : 0 ", style: TextStyle(color:Colors.blueAccent, fontWeight:FontWeight.w700) , textAlign:TextAlign.center)
                                           ])
                                       ),

                                       Expanded(
                                           flex: 1,
                                           child : Row ( children: [
                                             Text("총합 : " , style: TextStyle(fontWeight:FontWeight.w800), textAlign:TextAlign.center),
                                             Text(" 149 ", style: TextStyle(color:Colors.blueAccent, fontWeight:FontWeight.w700), textAlign:TextAlign.center)
                                           ])
                                       ),

                                       Expanded(
                                           flex: 1,
                                           child : Row ( children: [
                                             Text("이월수 : " , style: TextStyle(fontWeight:FontWeight.w800), textAlign:TextAlign.center),
                                             Text(" 1 " , style: TextStyle(color:Colors.blueAccent, fontWeight:FontWeight.w700), textAlign:TextAlign.center),
                                           ])
                                       ),
                                     ],
                                   )
                               )
                           ),

                           Container(
                               margin: const EdgeInsets.fromLTRB(10, 12, 10, 12),
                               padding: const EdgeInsets.fromLTRB(10, 12, 10, 12),
                               decoration: BoxDecoration(
                                 color: Colors.white,
                                 borderRadius: BorderRadius.circular(10),
                                 border: Border.all(color: Colors.black12, width: 1),
                               ),
                               child:  Column(
                                   children:  [
                                     Container(
                                       margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                                       padding: const EdgeInsets.fromLTRB(0,2,0,0),
                                       // height: 40,
                                       width: double.infinity,
                                       // color: Color(0xFFCB742F),
                                       child: Text("직전 회차 당첨 결과" , style: TextStyle(fontWeight:FontWeight.w800), textAlign:TextAlign.center),
                                     ),
                                     SizedBox(
                                         height: 35,
                                         child: Center(
                                           child: Row(
                                               children: [
                                                 Expanded(
                                                     flex: 1,
                                                     child : Text("1(0) ", style: TextStyle(color:Colors.deepPurpleAccent),  textAlign:TextAlign.center)
                                                 ),
                                                 Expanded(
                                                     flex: 1,
                                                     child : Text("2(0) ", style: TextStyle(color:Colors.orangeAccent), textAlign:TextAlign.center)
                                                 ),
                                                 Expanded(
                                                     flex: 1,
                                                     child : Text("3(0) ", style: TextStyle(color:Colors.greenAccent), textAlign:TextAlign.center)
                                                 ),
                                                 Expanded(
                                                     flex: 1,
                                                     child : Text("4(3) ", style: TextStyle(color:Colors.blueAccent), textAlign:TextAlign.center)
                                                 ),
                                                 Expanded(
                                                     flex: 1,
                                                     child : Text("5(120) ", style: TextStyle(color:Colors.redAccent), textAlign:TextAlign.center)
                                                 ),
                                               ]
                                           ),
                                         )
                                     ),
                                   ]
                               )
                           )
                         ]
             )
      );

  }
}