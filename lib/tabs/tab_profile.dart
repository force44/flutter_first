import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_first/component/number/SuggestionNumber.dart';
import 'package:flutter_first/provider/SuggestionLottoProvider.dart';
import 'package:provider/provider.dart';

class TabProfile extends StatefulWidget {
  const TabProfile({super.key});

  @override
  _TabProfile createState() => _TabProfile();
}


class _TabProfile extends State<TabProfile>{
  String turn = '';
  final List<String> _valueList = ['All', 'Buy', 'Skip'];
  String _selectedValue = 'All';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ChangeNotifierProvider(
        create: (BuildContext context) => SuggestionLottoProvider(),
        child:

        SingleChildScrollView(
        child:

        Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.blueAccent, width: 1),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.grey.withOpacity(0.5),
                    //     spreadRadius: 1,
                    //     blurRadius: 4,
                    //     offset: Offset(0, 3), // changes position of shadow
                    //   ),
                    // ],
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                          width: 170,
                          child: Row(
                              children: [
                                // Container(
                                //   width: 60,
                                //   margin: const EdgeInsets.all(5.0),
                                //   child:
                                //       TextField(
                                //           onChanged: (text) {
                                //             setState(() {
                                //               turn = text;
                                //             });
                                //           }
                                //           //, maxLength : 4
                                //           ,inputFormatters:[LengthLimitingTextInputFormatter(4)]
                                //           ,decoration: const InputDecoration(labelText: '회차')
                                //       )
                                //   )
                                // ,

                                Container(
                                    //width: 120,
                                    margin: const EdgeInsets.all(5.0),
                                    child:
                                      DropdownButton(
                                                value: _selectedValue,
                                                items: _valueList.map((value) {
                                                  return DropdownMenuItem(
                                                    value: value,
                                                    child: Text(value),
                                                  );
                                                }).toList(),
                                                onChanged: (value) {
                                                  setState(() {
                                                    _selectedValue = value!;
                                                  });
                                                },
                                              ),
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
                ),
                Container(
                    margin: const EdgeInsets.all(10.0),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.blueAccent, width: 1),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.grey.withOpacity(0.5),
                      //     spreadRadius: 1,
                      //     blurRadius: 4,
                      //     offset: Offset(0, 3), // changes position of shadow
                      //   ),
                      // ],
                    ),
                    child:  Column(
                        children:
                        [
                          SuggestionNumber(context.watch<SuggestionLottoProvider>().suggestionLotto) // 추천 번호
                        ]
                    )
                ),
              ]
          ),
        )
      ));
  }
}