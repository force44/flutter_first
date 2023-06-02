import 'package:flutter/material.dart';

class WinNumber extends StatelessWidget{

  final String numberText;

  WinNumber(
     this.numberText, {
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

   @override
   Widget build(BuildContext context) {
     Color color = _getNumberColor(int.parse(numberText));
     return Container(
         margin: const EdgeInsets.all(10.0),
         padding: const EdgeInsets.all(10.0),
         decoration: BoxDecoration(
           color: color,
           borderRadius: BorderRadius.circular(360),
           border: Border.all(color: Colors.black12, width: 1),
         ),
         child: Text(numberText,
                    style: TextStyle(fontWeight:FontWeight.w700), textAlign:TextAlign.center)
     );
   }

}