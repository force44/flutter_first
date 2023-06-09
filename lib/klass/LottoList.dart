


class LottoList{
  int id = 0;
  int turn = 0;
  int first = 0;
  int second = 0;
  int third = 0;
  int fourth = 0;
  int fifth = 0;
  int sixth = 0;

  LottoList(){
    print(">>>>>>>>>>>>>>>>>>>>>> default");
  }

  LottoList.init(this.id
      , this.turn
      , this.first
      , this.second
      , this.third
      , this.fourth
      , this.fifth
      , this.sixth
      );

  factory LottoList.fromJson(Map<String, dynamic> json) {
    return LottoList.init(json['id']
        , json['turn']
        , json['first']
        , json['second']
        , json['third']
        , json['fourth']
        , json['fifth']
        , json['sixth']
    );
  }
}

