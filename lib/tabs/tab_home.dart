import 'package:flutter/material.dart';

class TabHome extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return  Column(
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
                          child: Column(
                            children:  [

                                  Text( "1071회 당첨번호"),
                                  Text( "2023.06.10"),
                                  Text( "1,2,3,4,5,6"),
                                  Text( "1등 5명 각 52억")

                              ],
                          ),
                        ),
              ]
      );
  }
}