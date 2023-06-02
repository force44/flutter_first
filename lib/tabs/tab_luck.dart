import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


import 'package:provider/provider.dart';
import '../provider/TestProvider.dart';

import '../component/number/WinNumber.dart';

class TabLuck extends StatelessWidget{
  const TabLuck({super.key});


  //const TabLuck({Key? key}) : super(key: key);

  void _callAPI() async {
    var url = Uri.parse(
      'https://raw.githubusercontent.com/dev-yakuza/users/master/api.json',
    );
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

  }

  @override
  Widget build(BuildContext context) {
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
                            Text("나의 1등 목표", style: TextStyle(fontSize: 15.0, fontWeight:FontWeight.w700)),
                            Text("오늘도 푹자고", style: TextStyle(fontSize: 12.0), textAlign:TextAlign.left),
                            TextButton( onPressed: (){ context.read<TestProvider>().increase();}
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
                    WinNumber("01"),
                    WinNumber("10"),
                    WinNumber("15"),
                    WinNumber("25"),
                    WinNumber("35"),
                    WinNumber("39"),
                    Text("+"),
                    WinNumber("43"),
                  ],
                )
            )
          ]
      ),
      )
    );
  }
}