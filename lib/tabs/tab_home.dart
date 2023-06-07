import 'package:flutter/material.dart';

class TabHome extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Center(
      child:  Column(
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
                      width: 300,
                      child: Column(
                        children: const [
                          Text("나의 1등 목표", style: TextStyle(fontSize: 15.0, fontWeight:FontWeight.w700)),
                          Text("오늘도 푹자고", style: TextStyle(fontSize: 12.0), textAlign:TextAlign.left),
                          Text("상쾌한 하루 보내세요.", style: TextStyle(fontSize: 12.0), textAlign:TextAlign.left)
                      ]
                      )
                  ),
                  SizedBox(
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 60,
                             margin: const EdgeInsets.all(1.0),
                            // padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black12, width: 1),
                            ),
                            child: Center( child: Text("07h", style: TextStyle(fontWeight:FontWeight.w700), textAlign:TextAlign.center))
                          ),
                          Container(
                              width: 50,
                              height: 60,
                               margin: const EdgeInsets.all(1.0),
                              // padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black12, width: 1),
                              ),
                              child: Center( child: Text("30m", style: TextStyle(fontWeight:FontWeight.w700), textAlign:TextAlign.center))
                          ),
                        ],
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
              child: Row(
                children:  [
                  Expanded(
                      flex: 1,
                      child: Column(
                          children: [
                            Container(
                                margin: const EdgeInsets.all(1.0),
                                child: Text("일상루틴")),
                            Container(
                                margin: const EdgeInsets.all(1.0),
                                child: Text("4개", style: TextStyle(fontWeight:FontWeight.w700))),
                            Container(
                                width : 40,
                                margin: const EdgeInsets.all(1.0),
                                color: Colors.yellow.shade100,
                                child: Center( child: Text("4개", style: TextStyle(color: Colors.orange))))
                          ]
                      )
                  )                  ,
                  Expanded(
                      flex: 1,
                      child: Column(
                          children: [
                            Container(
                                margin: const EdgeInsets.all(1.0),
                                child: Text("당첨기록")),
                            Container(
                                margin: const EdgeInsets.all(1.0),
                                child: Text("724보", style: TextStyle(fontWeight:FontWeight.w700))),
                            Container(
                                width : 60,
                                margin: const EdgeInsets.all(1.0),
                                color: Colors.yellow.shade100,
                                child: Center( child: Text("3000보", style: TextStyle(color: Colors.orange))))
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
                                child: Text("생성기록")),
                            Container(
                                margin: const EdgeInsets.all(1.0),
                                child: Text("0개", style: TextStyle(fontWeight:FontWeight.w700))),
                            Container(
                                width : 40,
                                margin: const EdgeInsets.all(1.0),
                                color: Colors.yellow,
                                child: Center( child: Text("1개", style: TextStyle(color: Colors.orange))))
                          ]
                      )
                  )
                ],
              ),
            ),
          ]
      ),
    );
  }
}