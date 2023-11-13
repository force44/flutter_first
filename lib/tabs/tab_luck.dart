import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import '../component/number/CountWinNumber.dart';
import '../provider/LottoStatProvider.dart';
import '../component/number/WinNumber.dart';


class TabLuck extends StatefulWidget {
  const TabLuck({super.key});

  @override
  _TabLuck createState() => _TabLuck();
}

class _TabLuck extends State<TabLuck> {
  String from = '1000';
  String to = '';

  String seed = '12';
  final Map<String, String> _valueList = {
                                            '6' : '6',
                                            '10' : '10',
                                            '12' : '12',
                                            '16' : '16',
                                            '20' : '20',
                                            '24' : '24',
  };

  static final storage = FlutterSecureStorage();

  Future<String?> _getTurn() async{
    String? turn = await storage.read(key: '_turn');
    if( to == '' && turn != null){
      to = turn;
    }
    return turn;
  }

  @override
  void initState() {
    // 앱이 시작되면 시간을 재기 시작한다.
    super.initState();
    //await storage.read(key: '_turn')
    print("initState");
  }

  @override
  Widget build(BuildContext context) {

    return SizedBox(
            child: ChangeNotifierProvider(
                    create: (BuildContext context) => LottoStatProvider(),
                    child: SingleChildScrollView(
                            child: Column(
                                children: [
                                  Container(
                                      margin: const EdgeInsets.fromLTRB(15, 10, 0, 5),
                                      width: double.infinity,
                                      child:  Column(
                                        children:   [
                                          FutureBuilder(
                                              future: _getTurn(),
                                              builder: (BuildContext context, AsyncSnapshot snapshot) {
                                                return  SizedBox(
                                                              width: double.infinity,
                                                              child: Text( "${snapshot.data} 회차"
                                                                  , style: TextStyle(fontWeight:FontWeight.w600, fontSize: 20, color: Colors.orangeAccent)
                                                                  , textAlign: TextAlign.left)
                                                          );

                                              })
                                        ],
                                      )
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
                                    child: Row(
                                      children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Container(
                                                      //width: 80,
                                                      //margin: const EdgeInsets.all(5.0),
                                                      child: DropdownButton(
                                                        value: seed,
                                                        items: _valueList.keys.map((key) {
                                                          return DropdownMenuItem(
                                                            value: key,
                                                            child: Text(_valueList[key]!),
                                                          );
                                                        }).toList(),
                                                        onChanged: (value) {
                                                          setState(() {
                                                            seed = value!;
                                                          });
                                                        },
                                                      ),
                                                    )
                                                  ),

                                                  Expanded(
                                                      flex: 1,
                                                      child: TextField(
                                                          onChanged: (text) {
                                                            setState(() {
                                                              from = text;
                                                            });
                                                          }
                                                          , keyboardType: TextInputType.number
                                                          , maxLength : 4
                                                          , decoration: InputDecoration( labelText: 'from')
                                                      )
                                                  ),

                                                  Expanded(
                                                      flex: 1,
                                                      child: TextField(
                                                          onChanged: (text) {
                                                            setState(() {
                                                              to = text;
                                                            });
                                                          }
                                                          , keyboardType: TextInputType.number
                                                          , maxLength : 4
                                                          , decoration: InputDecoration( labelText: 'to')
                                                      )
                                                  ),
                                                  Expanded(
                                                      flex: 3,
                                                      child: Container(
                                                        margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                                        height: 70,
                                                        child: OutlinedButton(
                                                              onPressed: () {
                                                                context.read<LottoStatProvider>().suggestionLotto(from, to, seed);
                                                              },
                                                              style: OutlinedButton.styleFrom(foregroundColor: Color(0xFFFF8A80)),
                                                              child: Center( child: Text( 'Good\nLuck☆', style: TextStyle(fontWeight:FontWeight.w900) )),
                                                              )
                                                      )
                                                  )
                                                ]
                                            )
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
                                            //offset: Offset(0, 3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment :  CrossAxisAlignment.start,
                                        children: [
                                          Text("나만의 번호를 만들어 보세요!", style: TextStyle(color: Colors.black26, fontWeight:FontWeight.w800, fontSize: 12), textAlign: TextAlign.right),
                                          Row(
                                              children : [
                                                Expanded(
                                                  flex: 3,
                                                  child: WinNumber(context.watch<LottoStatProvider>().lottoNumber),
                                                ),
                                                Expanded(
                                                    flex: 1,
                                                    child:  Column(
                                                      children: [
                                                        OutlinedButton(
                                                            onPressed: () {
                                                              context.read<LottoStatProvider>().saveLotto();
                                                            },
                                                            style: OutlinedButton.styleFrom(foregroundColor: Colors.blueAccent),
                                                            child: Center( child: Text( 'Save', style: TextStyle(fontWeight:FontWeight.w900) ))
                                                        ),
                                                        Text("count : ${context.watch<LottoStatProvider>().count}"
                                                            , style: TextStyle(fontWeight:FontWeight.w400, )
                                                            , textAlign:TextAlign.center),
                                                      ],
                                                    )
                                                ),
                                              ]
                                          )

                                        ],
                                      )

                                  ),

                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                                    decoration: BoxDecoration(
                                      color: Colors.lightGreen,
                                      borderRadius: BorderRadius.circular(10),
                                    ),

                                    child:  Column(
                                        crossAxisAlignment :  CrossAxisAlignment.start,
                                        children:  [
                                          Text("추천된 번호의", style: TextStyle(color: Colors.white, fontWeight:FontWeight.w800, fontSize: 14), textAlign: TextAlign.right),
                                          Text("기간별 횟수를 확인하세요.", style: TextStyle(color: Colors.white, fontWeight:FontWeight.w800, fontSize: 14)),
                                          SizedBox(height: 10.0),
                                          CountWinNumber(context.watch<LottoStatProvider>().countByWinNumbers)
                                        ]
                                    )
                                  ),
                                  // 번호의 통계
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
                                              child: Text("역대 당첨 순위 결과" , style: TextStyle(fontWeight:FontWeight.w800), textAlign:TextAlign.center),
                                          ),
                                          SizedBox(
                                              height: 35,
                                              child: Center(
                                                      child: Row(
                                                          children: [
                                                            Expanded(
                                                                flex: 1,
                                                                child : Text("1(${context.watch<LottoStatProvider>().historyGrade[0]}) ", style: TextStyle(color:Colors.deepPurpleAccent),  textAlign:TextAlign.center)
                                                            ),
                                                            Expanded(
                                                                flex: 1,
                                                                child : Text("2(${context.watch<LottoStatProvider>().historyGrade[1]}) ", style: TextStyle(color:Colors.orangeAccent), textAlign:TextAlign.center)
                                                            ),
                                                            Expanded(
                                                                flex: 1,
                                                                child : Text("3(${context.watch<LottoStatProvider>().historyGrade[2]}) ", style: TextStyle(color:Colors.greenAccent), textAlign:TextAlign.center)
                                                            ),
                                                            Expanded(
                                                                flex: 1,
                                                                child : Text("4(${context.watch<LottoStatProvider>().historyGrade[3]}) ", style: TextStyle(color:Colors.blueAccent), textAlign:TextAlign.center)
                                                            ),
                                                            Expanded(
                                                                flex: 1,
                                                                child : Text("5(${context.watch<LottoStatProvider>().historyGrade[4]}) ", style: TextStyle(color:Colors.redAccent), textAlign:TextAlign.center)
                                                            ),
                                                          ]
                                                      ),
                                              )
                                            ),
                                        ]
                                      )
                                  )
                                  ,
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
                                                    Text(" ${context.watch<LottoStatProvider>().oddAndEvenRate} ", style: TextStyle(color:Colors.blueAccent, fontWeight:FontWeight.w700) , textAlign:TextAlign.center)
                                                  ])
                                              ),

                                              Expanded(
                                                  flex: 1,
                                                  child : Row ( children: [
                                                    Text("총합 : " , style: TextStyle(fontWeight:FontWeight.w800), textAlign:TextAlign.center),
                                                    Text(" ${context.watch<LottoStatProvider>().numberSum.toString()}", style: TextStyle(color:Colors.blueAccent, fontWeight:FontWeight.w700), textAlign:TextAlign.center)
                                                  ])
                                              ),

                                              Expanded(
                                                  flex: 1,
                                                  child : Row ( children: [
                                                    Text("이월수 : " , style: TextStyle(fontWeight:FontWeight.w800), textAlign:TextAlign.center),
                                                    Text(" ${context.watch<LottoStatProvider>().transferNumber}" , style: TextStyle(color:Colors.blueAccent, fontWeight:FontWeight.w700), textAlign:TextAlign.center),
                                                  ])
                                              ),
                                            ],
                                          )
                                      )
                                  )
                                  ,
                                  Container(
                                      margin: const EdgeInsets.all(10),
                                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF9A825),
                                        borderRadius: BorderRadius.circular(10),
                                      ),

                                      child:  Column(
                                          crossAxisAlignment :  CrossAxisAlignment.start,
                                          children:  const [
                                            Text("로또 분석 리포트로", style: TextStyle(color: Colors.white, fontWeight:FontWeight.w800, fontSize: 14), textAlign: TextAlign.right),
                                            Text("0.1%의 확률을 높여보아요", style: TextStyle(color: Colors.white, fontWeight:FontWeight.w800, fontSize: 14)),
                                            SizedBox(height: 10.0),

                                            Text("홀짝은 편중되지 않고 번호의 총합은 120~180으로 분포된다.", style: TextStyle(color: Colors.white, fontWeight:FontWeight.w400, fontSize: 11)),
                                            Text("나온 결과를 보고 Skip 하자!", style: TextStyle(color: Colors.white, fontWeight:FontWeight.w400, fontSize: 11))
                                          ]
                                      )
                                  ),
                        ])
                    )
                  )
    );
  }
}
