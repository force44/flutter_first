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
  final Map<String, String> _valueList = {
                                              'a': 'all',
                                              'b' : 'buy',
                                              's' : 'skip'
  };
  String _type = 'a';

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
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          flex :1,
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
                                                value: _type,
                                                items: _valueList.keys.map((key) {
                                                  return DropdownMenuItem(
                                                    value: key,
                                                    child: Text(_valueList[key]!),
                                                  );
                                                }).toList(),
                                                onChanged: (value) {
                                                  setState(() {
                                                    _type = value!;
                                                  });
                                                },
                                              ),
                                )
                              ]
                          )
                      ),
                      Expanded(
                          flex: 1,
                          child: SizedBox(
                              height: 70,
                              child: Center(
                                  child: OutlinedButton(
                                      onPressed: () {
                                        context.read<SuggestionLottoProvider>().searchList(_type);
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
                    ),
                    child:  Column(
                              children:[SuggestionNumber(context.watch<SuggestionLottoProvider>().suggestionLotto)]
                    )
                ),
              ]
          ),
        )
      ));
  }
}