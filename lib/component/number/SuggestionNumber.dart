import 'package:flutter/material.dart';

import '../../model/Lotto.dart';
import 'ColorNumber.dart';

class SuggestionNumber extends StatelessWidget{

  //final List list;
  final Lotto lotto;

  SuggestionNumber(
     this.lotto, {
     super.key,
  });


  // 추천 번호들 나래비!
  SizedBox _getLottoNumber() {
    List<Expanded> numbers = [];
    numbers.add(layOutTurn(lotto.turn));
    numbers.add(layOutNumber(lotto.first));
    numbers.add(layOutNumber(lotto.second));
    numbers.add(layOutNumber(lotto.third));
    numbers.add(layOutNumber(lotto.fourth));
    numbers.add(layOutNumber(lotto.fifth));
    numbers.add(layOutNumber(lotto.sixth));
    numbers.add(layOutGrade(lotto.grade));
    return SizedBox(child: Row(children: numbers));
  }

  SizedBox emptyText(){
    return
          SizedBox(
            //width: 60,
            //   margin: const EdgeInsets.all(1.0),
            //   padding: const EdgeInsets.all(4.0),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(360),
            //     border: Border.all(color: Colors.black12, width: 1),
            //   ),
              child: Text( "리스트가 없어요", style: const TextStyle(fontWeight:FontWeight.w500, color: Colors.grey), textAlign:TextAlign.center)
          );

  }

  Expanded layOutTurn(int number){
    return
      Expanded(
        flex: 2,
        child:
                  Container(
                    //width: 60,
                    margin: const EdgeInsets.all(1.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(360),
                      border: Border.all(color: Colors.grey, width: 1),
                    ),
                    child: Text( "${number.toString()}회", style: const TextStyle(fontWeight:FontWeight.w500, fontSize: 12), textAlign:TextAlign.center)
                  )
      );
  }

  Expanded layOutGrade(String text){
    return
      Expanded(
          flex: 1,
          child:
              Container(
                //width: 60,
                  margin: const EdgeInsets.all(2.0),
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(360),
                    border: Border.all(color: Colors.redAccent, width: 1),
                  ),
                  child: Text( text, style: TextStyle(fontWeight:FontWeight.w800, fontSize: 12), textAlign:TextAlign.center)
              )
      );
  }

  // 번호 하나의 플랫폼
  Expanded layOutNumber(int number){
    String numberTxt = number.toString();
    if(number < 10) {
      numberTxt = "0$numberTxt";      // 일의 자리는 0을 붙여 준다.
    }
    return
      Expanded(
        flex: 1,
        child:
                Container(
                margin: const EdgeInsets.all(4.0),
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: ColorNumber.getColorOfNumber(number),
                  borderRadius: BorderRadius.circular(360),
                  // border: Border.all(color:  _getNumberColor(number), width: 1),
                ),
                child: Text(numberTxt, style: const TextStyle(fontWeight:FontWeight.w400, fontSize: 12), textAlign:TextAlign.center)
            )
      );
  }

  @override
  Widget build(BuildContext context) {
    return _getLottoNumber();
  }
}