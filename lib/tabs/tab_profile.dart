import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_first/provider/SuggestionLottoProvider.dart';
import 'package:provider/provider.dart';

class TabProfile extends StatefulWidget {
  const TabProfile({super.key});

  @override
  _TabProfile createState() => _TabProfile();
}


class _TabProfile extends State<TabProfile>{

  String turn = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ChangeNotifierProvider(
        create: (BuildContext context) => SuggestionLottoProvider(),
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
                            width: 170,
                            child: Row(
                                children: [
                                  Container(
                                    width: 100,
                                    margin: const EdgeInsets.all(5.0),
                                    child: TextField(
                                      //    controller: seed,
                                        onChanged: (text) {
                                          setState(() {
                                            turn = text;
                                          });
                                        }
                                        //, maxLength : 4
                                        ,inputFormatters:[LengthLimitingTextInputFormatter(4)]
                                        ,decoration: InputDecoration(
                                      labelText: '회차',
                                    )),
                                  )
                                ]
                            )
                        ),
                        SizedBox(
                            width: 100,
                            height: 70,
                            child: SizedBox(
                                child: Center(
                                    child: OutlinedButton(
                                        onPressed: () {
                                          context.read<SuggestionLottoProvider>().searchList(turn);
                                        },
                                        style: OutlinedButton.styleFrom(foregroundColor: Colors.blueAccent),
                                        child: Center( child: Text( 'search', style: TextStyle(fontWeight:FontWeight.w400) ))

                                    )
                                )
                            )
                        )
                      ],
                    ),
                  )
                ]
        )
      ));
  }
}