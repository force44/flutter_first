import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


import 'package:provider/provider.dart';
import '../klass/Lotto.dart';
import '../provider/TestProvider.dart';

import '../component/number/WinNumber.dart';

class TabLuck extends StatelessWidget{
  const TabLuck({super.key});


  //const TabLuck({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    var text_a = "1111";

    var number_1 =  0;
    var number_2 =  0;
    var number_3 =  0;
    var number_4 =  0;
    var number_5 =  0;
    var number_6 =  0;



    return Center(
      child: ChangeNotifierProvider(create: (BuildContext context) => TestProvider(),
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
                          children:  [
                            Text(text_a, style: TextStyle(fontSize: 15.0, fontWeight:FontWeight.w700)),
                            Text("오늘도 푹자고", style: TextStyle(fontSize: 12.0), textAlign:TextAlign.left),
                            TextButton(
                                onPressed: (){ context.read<TestProvider>().increase();}
                                , child: Text(context.watch<TestProvider>().count.toString()))
                          ]
                      )
                  ),
                  SizedBox(
                      child: Row(
                        children: [
                          Container(
                              width: 70,
                              height: 50,
                              margin: const EdgeInsets.all(1.0),
                              // padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black12, width: 1),
                              ),
                              child: Center( child: Text("1등 추첨", style: TextStyle(fontWeight:FontWeight.w700), textAlign:TextAlign.center))
                          )
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
                  children: [
                    WinNumber(context.watch<TestProvider>().lottoNumber[0]),
                    WinNumber(context.watch<TestProvider>().lottoNumber[1]),
                    WinNumber(context.watch<TestProvider>().lottoNumber[2]),
                    WinNumber(context.watch<TestProvider>().lottoNumber[3]),
                    WinNumber(context.watch<TestProvider>().lottoNumber[4]),
                    WinNumber(context.watch<TestProvider>().lottoNumber[5])
                  ],
                )
            )
          ]
      ),
      )
    );
  }
}