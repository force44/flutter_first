

import 'package:flutter/material.dart';

class ColorNumber {


  static Color getColorOfNumber(int number){
    Color color = const Color(0xfffbc400);
    if(number > 40){
      color = const Color(0xffb0d840);
    }else if(number > 30 && number <= 40){
      color = const Color(0xffaaaaaa);
    }else if(number > 20 && number <= 30){
      color = const Color(0xffff7272);
    }else if(number > 10 && number <= 20){
      color = const Color(0xff69c8f2);
    }
    return color;
  }


}