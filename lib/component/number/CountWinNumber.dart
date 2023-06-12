import 'package:flutter/material.dart';

class CountWinNumber extends StatelessWidget{

  final List countWinNumber;

  CountWinNumber(
     this.countWinNumber, {
     super.key,
  });

  // 추천 번호들 나래비!
  SizedBox _getLottoNumber() {
    List<Expanded> numbers = [];
    for(var i = 0; i < countWinNumber.length; i ++){
      var number = countWinNumber[i];
      numbers.add(layOutNumber(number));
    }

    return SizedBox(
        child:  Row(children: numbers)
    );
  }

  // 번호 하나의 플랫폼
  Expanded layOutNumber(int number){
    return Expanded(
        flex: 1,
        //width: 20,
        //margin: const EdgeInsets.fromLTRB(0, 0, 15, 13),
        //padding: const EdgeInsets.all(5.0),
        // decoration: BoxDecoration(
        //   color: _getNumberColor(number),
        //   borderRadius: BorderRadius.circular(360),
        //   border: Border.all(color: Colors.black12, width: 1),
        // ),
        child: Text(number.toString(), style: TextStyle(fontWeight:FontWeight.w700, color: Colors.blueAccent), textAlign:TextAlign.center)
    );
  }

  @override
  Widget build(BuildContext context) {
    return _getLottoNumber();
  }

}