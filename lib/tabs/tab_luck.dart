import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:provider/provider.dart';
import '../component/number/CountWinNumber.dart';
import '../klass/Lotto.dart';
import '../provider/LottoProvider.dart';

import '../component/number/WinNumber.dart';

class TabLuck extends StatelessWidget {
  const TabLuck({super.key});

  //const TabLuck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController seed = TextEditingController();
    TextEditingController from = TextEditingController();
    TextEditingController to = TextEditingController();


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
                                          controller: seed,
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
                                          child: TextField( controller: from, decoration: InputDecoration( labelText: 'from')
                                          )
                                      ),

                                      Container(
                                          width: 80,
                                          child: TextField( controller: to, decoration: InputDecoration( labelText: 'to')
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
                                context.read<LottoProvider>().suggestionLotto(seed.value.text, from.value.text, to.value.text);
                              },
                              style: OutlinedButton.styleFrom(foregroundColor: Colors.blue),
                              child: Center( child: Text( 'good Luck!!', style: TextStyle(fontWeight:FontWeight.w900) ))

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
                                     ],
                                   ),
                                  // Row(
                                  //   children: [
                                  //     CountWinNumber(context.watch<LottoProvider>().countByWinNumbers)
                                  //   ],
                                  // ),
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
                                  Text("from~to 별 당첨 횟수 : ", style: TextStyle(fontWeight:FontWeight.w700), textAlign:TextAlign.center),
                                  CountWinNumber(context.watch<LottoProvider>().countByWinNumbers)
                                ],
                              ),

                                Row(
                                  children: [
                                    Text("홀짝 : " , style: TextStyle(fontWeight:FontWeight.w700), textAlign:TextAlign.center),
                                    SizedBox(width: 50, child: Text("< ${context.watch<LottoProvider>().oddAndEvenRate} >")),
                                    Text("총합 : " , style: TextStyle(fontWeight:FontWeight.w700), textAlign:TextAlign.center),
                                    Text(context.watch<LottoProvider>().numberSum.toString()),
                                  ],
                                ),

                              Row(
                                children: [
                                  Text("등급 : " , style: TextStyle(fontWeight:FontWeight.w100), textAlign:TextAlign.center),
                                  Text(context.watch<LottoProvider>().historyGrade.toString())
                                ],
                              )
                            ],

            )
        )






      ]),
    ));
  }
}
