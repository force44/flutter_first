


class Lotto{
  int turn = 0;
  List lottoNumber =List<int>.filled(6, 0);

  //..
  Lotto(){
    print(">>>>>>>>>>>>>>>>>>>>>>");
  }

  Lotto.init(this.lottoNumber){
    print(">>>>>>>>>>>>>>>>>>>>>> init");
  }

  factory Lotto.fromJson(Map<String, dynamic> json) {
    return Lotto.init(json['lottoNumber']);
  }
}

