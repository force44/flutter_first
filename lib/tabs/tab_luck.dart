import 'dart:convert';

import 'package:flutter/material.dart';
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
  //const TabLuck({super.key});
  //const TabLuck({Key? key}) : super(key: key);

  String seed = '';
  String from = '';
  String to = '';

  @override
  Widget build(BuildContext context) {

    return Center(
        child: ChangeNotifierProvider(
        create: (BuildContext context) => LottoStatProvider(),
        child: SingleChildScrollView(
                child: Column(
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
                          children: [
                                      Expanded(
                                        flex: 1,
                                        child: TextField(
                                          //    controller: seed,
                                            onChanged: (text) {
                                              setState(() {
                                                seed = text;
                                              });
                                            }
                                            , maxLength : 2
                                            , keyboardType: TextInputType.number
                                            //,inputFormatters:[LengthLimitingTextInputFormatter(4)]
                                            ,decoration: InputDecoration(
                                              labelText: 'seed',
                                             )
                                        ),
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
                                          flex: 2,
                                          child: Container(
                                            margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                            height: 70,
                                            child: OutlinedButton(
                                                  onPressed: () {
                                                    context.read<LottoStatProvider>().suggestionLotto(from, to, seed: seed);
                                                  },
                                                  style: OutlinedButton.styleFrom(foregroundColor: Colors.redAccent),
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
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child:  Column(
                              children:
                              [
                                Row(
                                  children: [
                                      WinNumber(context.watch<LottoStatProvider>().lottoNumber) // 추천 번호
                                    , SizedBox(
                                        //width: 80,
                                        child: Column(
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
                              SizedBox(
                                child:
                                  Text("from ~ to 출현 횟수 ↓↓", style: TextStyle(fontWeight:FontWeight.w800), textAlign:TextAlign.center),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                                child: Center( child: CountWinNumber(context.watch<LottoStatProvider>().countByWinNumbers))
                              ),
                              Container(
                                  margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                                  child: Row(
                                    children: [
                                      Text("홀짝 : " , style: TextStyle(fontWeight:FontWeight.w700), textAlign:TextAlign.center),
                                      SizedBox(width: 50,
                                          child: Text(" ${context.watch<LottoStatProvider>().oddAndEvenRate} "
                                              , style: TextStyle(color:Colors.orangeAccent))
                                      ),
                                      Text("총합 : " , style: TextStyle(fontWeight:FontWeight.w700), textAlign:TextAlign.center),
                                      SizedBox(width: 50,
                                          child: Text(" ${context.watch<LottoStatProvider>().numberSum.toString()}"
                                              , style: TextStyle(color:Colors.orangeAccent))
                                      ),
                                      Text("이월수 : " , style: TextStyle(fontWeight:FontWeight.w700), textAlign:TextAlign.center),
                                      Text(" ${context.watch<LottoStatProvider>().transferNumber}개"
                                            , style: TextStyle(color:Colors.orangeAccent)),
                                    ],
                                  )
                              ),

                              Text("역대 당첨 순위 ↓↓" , style: TextStyle(fontWeight:FontWeight.w700), textAlign:TextAlign.center),

                              Container(
                                  margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                                  child: Center(
                                    child: Row(
                                      children: [
                                        Text("1(${context.watch<LottoStatProvider>().historyGrade[0]}) ", style: TextStyle(color:Colors.deepPurpleAccent), textAlign:TextAlign.center),
                                        Text("2(${context.watch<LottoStatProvider>().historyGrade[1]}) ", style: TextStyle(color:Colors.orangeAccent), textAlign:TextAlign.center),
                                        Text("3(${context.watch<LottoStatProvider>().historyGrade[2]}) ", style: TextStyle(color:Colors.greenAccent), textAlign:TextAlign.center),
                                        Text("4(${context.watch<LottoStatProvider>().historyGrade[3]}) ", style: TextStyle(color:Colors.blueAccent), textAlign:TextAlign.center),
                                        Text("5(${context.watch<LottoStatProvider>().historyGrade[4]}) ", style: TextStyle(color:Colors.redAccent), textAlign:TextAlign.center)
                                      ],
                                    ),
                                  )
                              ),





                            ],

                          )
                      )
                    ])
        )
      ));
  }
}
