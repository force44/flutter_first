import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../component/number/CountWinNumber.dart';
import '../provider/LottoStatProvider.dart';
import '../component/number/WinNumber.dart';


class TabSearch extends StatefulWidget {
  @override
  _TabSearch createState() => _TabSearch();
}

class _TabSearch extends  State<TabSearch> {

  //const TabLuck({super.key});
  //const TabLuck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String seed = '';
    String from = '';
    String to = '';

    return Center(
        child: ChangeNotifierProvider(
            create: (BuildContext context) => LottoStatProvider(),
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
                                        , inputFormatters:[LengthLimitingTextInputFormatter(3)]
                                        ,
                                        decoration: InputDecoration(
                                          labelText: '나이',
                                        )),
                                  ),

                                  Container(
                                      width: 50,
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 0, 10.0, 0),
                                      child: TextField(
                                          onChanged: (text) {
                                            setState(() {
                                              from = text;
                                            });
                                          }
                                          ,
                                          keyboardType: TextInputType.number
                                          , inputFormatters:[LengthLimitingTextInputFormatter(3)]
                                          , decoration: InputDecoration(
                                              labelText: '키')
                                      )
                                  ),

                                  SizedBox(
                                      width: 70,
                                      child: TextField(
                                          onChanged: (text) {
                                            setState(() {
                                              to = text;
                                            });
                                          }
                                          , keyboardType: TextInputType.number
                                          , inputFormatters:[LengthLimitingTextInputFormatter(6)]
                                          , decoration: InputDecoration(
                                          labelText: '지역')
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
                                          //context.read<LottoStatProvider>().suggestionLotto(seed, from, to);
                                        },
                                        style: OutlinedButton.styleFrom(
                                            foregroundColor: Colors.redAccent),
                                        child: Center(child: Text('❤❤︎',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900)))

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
                      child: Column(
                          children:
                          [
                            Row(
                              children: [
                                WinNumber(context
                                    .watch<LottoStatProvider>()
                                    .lottoNumber) // 추천 번호
                                , SizedBox(
                                    width: 80,
                                    child: Column(
                                      children: [
                                        Container(
                                          //margin: const EdgeInsets.fromLTRB(0, 0, 10, 5),
                                            child: OutlinedButton(
                                                onPressed: () {
                                                  context.read<LottoStatProvider>()
                                                      .saveLotto();
                                                },
                                                style: OutlinedButton.styleFrom(
                                                    foregroundColor: Colors
                                                        .blueAccent),
                                                child: Center(child: Text(
                                                    'Save', style: TextStyle(
                                                    fontWeight: FontWeight
                                                        .w900)))

                                            )
                                        ),

                                        Text("count : ${context
                                            .watch<LottoStatProvider>()
                                            .count}"
                                            , style: TextStyle(
                                              fontWeight: FontWeight.w400,)
                                            , textAlign: TextAlign.center),
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
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("from~to 출현횟수 : ",
                                  style: TextStyle(fontWeight: FontWeight.w800),
                                  textAlign: TextAlign.center),
                              CountWinNumber(context
                                  .watch<LottoStatProvider>()
                                  .countByWinNumbers)
                            ],
                          ),

                          Container(
                              margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                              child: Row(
                                children: [
                                  Text("홀짝 : ",
                                      style: TextStyle(fontWeight: FontWeight
                                          .w700), textAlign: TextAlign.center),
                                  SizedBox(width: 60,
                                      child: Text(" ${context
                                          .watch<LottoStatProvider>()
                                          .oddAndEvenRate} "
                                          , style: TextStyle(
                                              color: Colors.blueAccent))
                                  ),
                                  Text("총합 : ",
                                      style: TextStyle(fontWeight: FontWeight
                                          .w700), textAlign: TextAlign.center),
                                  SizedBox(width: 60,
                                      child: Text(" ${context
                                          .watch<LottoStatProvider>()
                                          .numberSum
                                          .toString()}"
                                          , style: TextStyle(
                                              color: Colors.blueAccent))
                                  ),
                                  Text("이월수 : ",
                                      style: TextStyle(fontWeight: FontWeight
                                          .w700), textAlign: TextAlign.center),
                                  Text(" ${context
                                      .watch<LottoStatProvider>()
                                      .transferNumber}개",
                                      style: TextStyle(color: Colors
                                          .blueAccent)),
                                ],
                              )),

                          Row(
                            children: [
                              Text("역대 당첨 순위 : ",
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                  textAlign: TextAlign.center),
                              Text("1(${context
                                  .watch<LottoStatProvider>()
                                  .historyGrade[0]}) "
                                  "2(${context
                                  .watch<LottoStatProvider>()
                                  .historyGrade[1]}) "
                                  "3(${context
                                  .watch<LottoStatProvider>()
                                  .historyGrade[2]}) "
                                  "4(${context
                                  .watch<LottoStatProvider>()
                                  .historyGrade[3]}) "
                                  "5(${context
                                  .watch<LottoStatProvider>()
                                  .historyGrade[4]}) "
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