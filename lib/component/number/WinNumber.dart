import 'package:flutter/material.dart';

class WinNumber extends StatelessWidget{

  final List lottoNumber;

  WinNumber(
     this.lottoNumber, {
     super.key,
});

  Color _getNumberColor(int number){
    Color color = const Color(0xfffbc400);
    if(number >= 40){
      color = const Color(0xffb0d840);
    }else if(number >= 30 && number < 40){
      color = const Color(0xffaaaaaa);
    }else if(number >= 20 && number < 30){
      color = const Color(0xffff7272);
    }else if(number >= 10 && number < 20){
      color = const Color(0xff69c8f2);
    }
    return color;
  }

  // 추천 번호들 나래비!
  SizedBox _getLottoNumber() {
    List<Expanded> numbers = [];
    for(var i = 0; i < lottoNumber.length; i ++){
      numbers.add(layOutNumber(lottoNumber[i]));
    }

    return SizedBox(
        child: Row(children: numbers)
    );
  }

  // 번호 하나의 플랫폼
  Expanded layOutNumber(int number){
    var numberTxt = number.toString();
    if(number < 9) {
      numberTxt = "0$numberTxt";      // 일의 자리는 0을 붙여 준다.
    }
    return
      Expanded(
        flex: 1,
        child: Container(
                          margin: const EdgeInsets.all(4.0),
                          padding: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            color: _getNumberColor(number),
                            borderRadius: BorderRadius.circular(360),
                            border: Border.all(color: Colors.black12, width: 1),
                          ),
                          child: Text(numberTxt, style: TextStyle(fontWeight:FontWeight.w500), textAlign:TextAlign.center)
                      )
      );
  }

  @override
  Widget build(BuildContext context) {
    return _getLottoNumber();
  }
}