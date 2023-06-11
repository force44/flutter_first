import 'package:flutter/material.dart';

import '../../klass/Lotto.dart';

class SuggestionNumber extends StatelessWidget{

  final List list;

  SuggestionNumber(
     this.list, {
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
  List<SizedBox> _getLottoNumber() {
    List<SizedBox> sizeBox = [];
    for(Lotto lotto in list){
      List<Container> numbers = [];
      numbers.add(layOutTurn(lotto.turn));
      numbers.add(layOutNumber(lotto.first));
      numbers.add(layOutNumber(lotto.second));
      numbers.add(layOutNumber(lotto.third));
      numbers.add(layOutNumber(lotto.fourth));
      numbers.add(layOutNumber(lotto.fifth));
      numbers.add(layOutNumber(lotto.sixth));
      sizeBox.add(SizedBox(child: Row(children: numbers)));
    }
     return sizeBox;
  }

  Container layOutTurn(int number){
    return Container(
        width: 60,
        margin: const EdgeInsets.all(4.0),
        padding: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black12, width: 1),
        ),
        child: Text( "${number.toString()}회", style: const TextStyle(fontWeight:FontWeight.w500), textAlign:TextAlign.center)
    );
  }

  // 번호 하나의 플랫폼
  Container layOutNumber(int number){
    String numberTxt = number.toString();
    if(number < 9) {
      numberTxt = "0$numberTxt";      // 일의 자리는 0을 붙여 준다.
    }
    return Container(
        margin: const EdgeInsets.all(4.0),
        padding: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: _getNumberColor(number),
          borderRadius: BorderRadius.circular(360),
          border: Border.all(color: Colors.black12, width: 1),
        ),
        child: Text(numberTxt, style: const TextStyle(fontWeight:FontWeight.w400), textAlign:TextAlign.center)
    );
  }

  @override
  Widget build(BuildContext context) {
    return
            SizedBox(
                child:
                        Center(
                            child:Column(
                               mainAxisSize: MainAxisSize.min,
                                children: _getLottoNumber()
                            )
                        )
            );

  }
}