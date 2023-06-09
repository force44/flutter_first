import 'LottoSummary.dart';

class Lotto{
  int id = 0;
  int turn = 0;
  int first = 0;
  int second = 0;
  int third = 0;
  int fourth = 0;
  int fifth = 0;
  int sixth = 0;
  int bonus = 0;
  String regDt = "";
  String grade = "";
  LottoSummary lottoSummary;

  Lotto.init(this.id
      , this.turn
      , this.first
      , this.second
      , this.third
      , this.fourth
      , this.fifth
      , this.sixth
      , this.bonus
      , this.regDt
      , this.grade
      , this.lottoSummary
      );

  factory Lotto.fromJson(Map<String, dynamic> json) {
    return Lotto.init(
          json['id']
        , json['turn']
        , json['first']
        , json['second']
        , json['third']
        , json['fourth']
        , json['fifth']
        , json['sixth']
        , json['bonus']
        , json['regDt']
        , json['grade']
        , LottoSummary.fromJson(json['lottoSummary'])
    );
  }
}

