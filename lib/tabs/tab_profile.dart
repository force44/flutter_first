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
  String turn = '1070';
  final Map<String, String> _valueList = {
                                              'A' : '전체s',
                                              'R' : '만들어낸',
                                              'S' : '저장한'
  };
  String _type = 'A';

  @override
  Widget build(BuildContext context) {

    //context.read<SuggestionLottoProvider>().searchList(_type);

    return SizedBox(
                child: ChangeNotifierProvider(
                        create: (BuildContext context) => SuggestionLottoProvider(),
                        child: SingleChildScrollView(
                          child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(5.0),
                                  padding: const EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.blueAccent, width: 1),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex :3,
                                          child: Row(
                                              children: [
                                                Container(
                                                  width: 80,
                                                  margin: const EdgeInsets.all(5.0),
                                                  child: TextField(
                                                          onChanged: (text) {
                                                            setState(() {
                                                              turn = text;
                                                            });
                                                          }
                                                          //, maxLength : 4
                                                          ,inputFormatters:[LengthLimitingTextInputFormatter(4)]
                                                          ,decoration: InputDecoration(
                                                                            border: OutlineInputBorder(),
                                                                            labelText: '회차'
                                                                        )
                                                        )
                                                  )
                                                ,

                                                Container(
                                                    width: 100,
                                                    margin: const EdgeInsets.all(5.0),
                                                    child: DropdownButton(
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
                                                      height: 40,
                                                      child:  OutlinedButton(
                                                              onPressed: () {
                                                                context.read<SuggestionLottoProvider>().searchList(_type);
                                                              },
                                                              style: OutlinedButton.styleFrom(foregroundColor: Colors.blueAccent),
                                                              child: Center(
                                                                  child: Text('검색s', style: TextStyle(fontWeight:FontWeight.w800, color: Colors.blueAccent))
                                                              )
                                                          )

                                          )
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                    margin: const EdgeInsets.all(5.0),
                                    padding: const EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.blueAccent, width: 1),
                                    ),
                                    child:  Column(
                                              children:[
                                                SuggestionNumber(context.watch<SuggestionLottoProvider>().suggestionLotto)
                                              ]
                                    )
                                ),
                              ]
                          ),
                        )
                      )
    );
  }
}