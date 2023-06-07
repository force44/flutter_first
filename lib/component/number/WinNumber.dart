import 'package:flutter/material.dart';

class WinNumber extends StatelessWidget{

  final List lottoNumber;

  WinNumber(
     this.lottoNumber, {
     super.key,
  });

  Color _getNumberColor(int number){
    Color color = Colors.yellow;
    if(number >= 40){
      color = Colors.green;
    }else if(number >= 30 && number < 40){
      color = Colors.grey;
    }else if(number >= 20 && number < 30){
      color = Colors.red;
    }else if(number >= 10 && number < 20){
      color = Colors.blue;
    }
    return color;
  }

  // 추천 번호들 나래비!
  SizedBox _getLottoNumber() {
    List<Container> numbers = [];
    for(var i = 0; i < lottoNumber.length; i ++){
      var number = lottoNumber[i];
      var numberTxt = number.toString();
      if(number < 9) {
        numberTxt = "0$numberTxt";      // 일의 자리는 0을 붙여 준다.
      }
      numbers.add(layOutNumber(number, numberTxt));
    }

    return SizedBox(
        child: Row(children: numbers)
    );
  }

  // 번호 하나의 플랫폼
  Container layOutNumber(int number, String numberTxt){
    return Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: _getNumberColor(number),
          borderRadius: BorderRadius.circular(360),
          border: Border.all(color: Colors.black12, width: 1),
        ),
        child: Text(numberTxt, style: TextStyle(fontWeight:FontWeight.w700), textAlign:TextAlign.center)
    );
  }

  @override
  Widget build(BuildContext context) {
    return _getLottoNumber();
  }

}