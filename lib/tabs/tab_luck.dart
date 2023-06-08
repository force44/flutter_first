import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';




import 'package:provider/provider.dart';
import '../component/number/CountWinNumber.dart';
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
    String seed = '';
    String from = '';
    String to = '';

    return Center(
        child: ChangeNotifierProvider(
        create: (BuildContext context) => LottoProvider(),
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
                    SizedBox(
                        width: 210,
                        child: Row(
                            children: [
                                          Container(
                                            width: 50,
                                            margin: const EdgeInsets.all(5.0),
                                            child: TextField(
                                            //    controller: seed,
                                                onChanged: (text) {
                                                  setState(() {
                                                    seed = text;
                                                  });
                                                }
                                                , maxLength : 2
                                                //,inputFormatters:[LengthLimitingTextInputFormatter(4)]
                                                ,decoration: InputDecoration(
                                                  labelText: 'seed',
                                                  //hintText: 'random number gen size',
                                                  // labelStyle: TextStyle(color: Colors.redAccent),
                                                  // focusedBorder: OutlineInputBorder(
                                                  //   borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                  //   borderSide:
                                                  //   BorderSide(width: 1, color: Colors.redAccent),
                                                  // ),
                                                  // enabledBorder: OutlineInputBorder(
                                                  //   borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                  //   borderSide:
                                                  //   BorderSide(width: 1, color: Colors.redAccent),
                                                  // ),
                                                  // border: OutlineInputBorder(
                                                  //   borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                  // ),
                                                )),
                                          ),

                                          Container(
                                              width: 50,
                                              margin: const EdgeInsets.fromLTRB(0, 0, 10.0, 0),
                                              child: TextField(
                                                  onChanged: (text) {
                                                    setState(() {
                                                      from = text;
                                                    });
                                                  }
                                                  , keyboardType: TextInputType.number
                                                  , maxLength : 4
                                                  //, inputFormatters:[LengthLimitingTextInputFormatter(4)]
                                              , decoration: InputDecoration( labelText: 'from')
                                              )
                                          ),

                                          SizedBox(
                                            width: 50,
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
                                        )

                                      ]
                        )
                    ),
                    SizedBox(
                        width: 70,
                        height: 70,
                        child: SizedBox(
                            child: Center(
                                child: OutlinedButton(
                                    onPressed: () {
                                      context.read<LottoProvider>().suggestionLotto(seed, from, to);
                                    },
                                    style: OutlinedButton.styleFrom(foregroundColor: Colors.redAccent),
                                    child: Center( child: Text( 'Luck!!', style: TextStyle(fontWeight:FontWeight.w900) ))

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
                                                width: 80,
                                                child: Column(
                                                            children: [
                                                              Container(
                                                                  //margin: const EdgeInsets.fromLTRB(0, 0, 10, 5),
                                                                  child: OutlinedButton(
                                                                      onPressed: () {
                                                                        context.read<LottoProvider>().saveLotto();
                                                                      },
                                                                      style: OutlinedButton.styleFrom(foregroundColor: Colors.blueAccent),
                                                                      child: Center( child: Text( 'Save', style: TextStyle(fontWeight:FontWeight.w900) ))

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
                                                  Text("from~to 출현횟수 : ", style: TextStyle(fontWeight:FontWeight.w800), textAlign:TextAlign.center),
                                                  CountWinNumber(context.watch<LottoProvider>().countByWinNumbers)
                                                ],
                                              ),

                                              Container(
                                                  margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                                                  child: Row(
                                                    children: [
                                                      Text("홀짝 : " , style: TextStyle(fontWeight:FontWeight.w700), textAlign:TextAlign.center),
                                                      SizedBox(width: 60,
                                                          child: Text(" ${context.watch<LottoProvider>().oddAndEvenRate} "
                                                              , style: TextStyle(color:Colors.blueAccent))
                                                      ),
                                                      Text("총합 : " , style: TextStyle(fontWeight:FontWeight.w700), textAlign:TextAlign.center),
                                                      SizedBox(width: 60,
                                                          child: Text(" ${context.watch<LottoProvider>().numberSum.toString()}"
                                                              , style: TextStyle(color:Colors.blueAccent))
                                                      ),
                                                      Text("이월수 : " , style: TextStyle(fontWeight:FontWeight.w700), textAlign:TextAlign.center),
                                                      Text(" ${context.watch<LottoProvider>().transferNumber}개" , style: TextStyle(color:Colors.blueAccent)),
                                                    ],
                                              )),

                                              Row(
                                                children: [
                                                  Text("역대 당첨 순위 : " , style: TextStyle(fontWeight:FontWeight.w700), textAlign:TextAlign.center),
                                                  Text("1(${context.watch<LottoProvider>().historyGrade[0]}) "
                                                       "2(${context.watch<LottoProvider>().historyGrade[1]}) "
                                                       "3(${context.watch<LottoProvider>().historyGrade[2]}) "
                                                       "4(${context.watch<LottoProvider>().historyGrade[3]}) "
                                                       "5(${context.watch<LottoProvider>().historyGrade[4]}) "
                                                  )
                                                ],
                                              )
                                            ],

                            )
                        )
            ])
      ));
  }
}
