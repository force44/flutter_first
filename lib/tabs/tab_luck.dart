import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:provider/provider.dart';
import '../component/number/CountWinNumber.dart';
import '../klass/Lotto.dart';
import '../provider/LottoProvider.dart';

import '../component/number/WinNumber.dart';


class TabLuck extends StatefulWidget {
  @override
  _TabLuck createState() => _TabLuck();
}

class _TabLuck extends State<TabLuck> {
//  const TabLuck({super.key});

  //const TabLuck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String _seed = '';
    String _from = '';
    String _to = '';


    return Center(
        child: ChangeNotifierProvider(
        create: (BuildContext context) => LottoProvider(),
        child: Column(children: [
          Container(
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.all(10.0),
            height: 100,
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
                    flex: 2,
                    child: Row(
                        children: [
                                      Container(
                                        width: 80,
                                        margin: const EdgeInsets.all(10.0),
                                        child: TextField(
                                        //    controller: seed,
                                            onChanged: (text) {
                                              setState(() {
                                                _seed = text;
                                              });
                                            },

                                            decoration: InputDecoration(
                                              labelText: 'seed',
                                              //hintText: 'random number gen size',
                                              labelStyle: TextStyle(color: Colors.redAccent),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                borderSide:
                                                BorderSide(width: 1, color: Colors.redAccent),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                borderSide:
                                                BorderSide(width: 1, color: Colors.redAccent),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                              ),
                                            )),
                                      ),

                                        Container(
                                            width: 80,
                                            margin: const EdgeInsets.fromLTRB(0, 0, 10.0, 0),
                                            child: TextField(
                                                onChanged: (text) {
                                                  setState(() {
                                                    _from = text;
                                                  });
                                                }
                                            , decoration: InputDecoration( labelText: 'from')
                                            )
                                        ),

                                        Container(
                                            width: 80,
                                            child: TextField(

                                                onChanged: (text) {
                                                  setState(() {
                                                    _to = text;
                                                  });
                                                }
                                            , decoration: InputDecoration( labelText: 'to')
                                            )
                                        )

                                  ]
                    )
                ),


                Expanded(
                    flex: 1,
                    child: SizedBox(
                        width: 120,
                        child: Center(
                            child: OutlinedButton(
                                onPressed: () {
                                  context.read<LottoProvider>().suggestionLotto(_seed, _from, _to);
                                },
                                style: OutlinedButton.styleFrom(foregroundColor: Colors.red),
                                child: Center( child: Text( 'Good Luck!!', style: TextStyle(fontWeight:FontWeight.w900) ))

                            )
                        )
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
              child:  Column(
                              children:
                                  [
                                    Row(
                                      children: [
                                          WinNumber(context.watch<LottoProvider>().lottoNumber) // 추천 번호
                                         , SizedBox(
                                            width: 110,
                                            child: Column(
                                                        children: [
                                                          Container(
                                                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                                                              child: OutlinedButton(
                                                                  onPressed: () {
                                                                    context.read<LottoProvider>().saveLotto();
                                                                  },
                                                                  style: OutlinedButton.styleFrom(foregroundColor: Colors.blue),
                                                                  child: Center( child: Text( 'SAVE', style: TextStyle(fontWeight:FontWeight.w900) ))

                                                              )
                                                          ),

                                                          Text("count : ${context.watch<LottoProvider>().count}"
                                                              , style: TextStyle(fontWeight:FontWeight.w400, )
                                                              , textAlign:TextAlign.center),
                                                        ],
                                            )
                                          )
                                       ],
                                     ),

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
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child:  Column(
                              children:  [
                                Row(
                                  children: [
                                    Text("from~to별 출현 횟수 : ", style: TextStyle(fontWeight:FontWeight.w800), textAlign:TextAlign.center),
                                    CountWinNumber(context.watch<LottoProvider>().countByWinNumbers)
                                  ],
                                ),

                                  Row(
                                    children: [
                                      Text("홀짝 : " , style: TextStyle(fontWeight:FontWeight.w700), textAlign:TextAlign.center),
                                      SizedBox(width: 80,
                                          child: Text(" < ${context.watch<LottoProvider>().oddAndEvenRate} >"
                                                        , style: TextStyle(color:Colors.blueAccent))
                                      ),
                                      Text("총합 : " , style: TextStyle(fontWeight:FontWeight.w700), textAlign:TextAlign.center),
                                      SizedBox(width: 80,
                                          child: Text(" ${context.watch<LottoProvider>().numberSum.toString()}"
                                              , style: TextStyle(color:Colors.blueAccent))
                                      ),
                                      Text("이월수 : " , style: TextStyle(fontWeight:FontWeight.w700), textAlign:TextAlign.center),
                                      Text(" ${context.watch<LottoProvider>().transferNumber}개" , style: TextStyle(color:Colors.blueAccent)),
                                    ],
                                  ),

                                Row(
                                  children: [
                                    Text("역대 당첨 순위 개수 : " , style: TextStyle(fontWeight:FontWeight.w700), textAlign:TextAlign.center),
                                    Text("1등(${context.watch<LottoProvider>().historyGrade[0]}) "
                                         "2등(${context.watch<LottoProvider>().historyGrade[1]}) "
                                         "3등(${context.watch<LottoProvider>().historyGrade[2]}) "
                                         "4등(${context.watch<LottoProvider>().historyGrade[3]}) "
                                         "5등(${context.watch<LottoProvider>().historyGrade[4]}) "
                                    )
                                  ],
                                )
                              ],

              )
          )
        ]),
      ));
  }
}
