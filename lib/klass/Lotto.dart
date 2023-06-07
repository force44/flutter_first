


class Lotto{
  int turn = 0;
  String oddAndEvenRate = "";
  int numberSum = 0;
  String transferNumber = "";
  List lottoNumbers = List<int>.filled(6, 0);
  List countByWinNumbers = List<int>.filled(6, 0);
  List historyGrade = List<int>.filled(6, 0);

  Lotto(){
    print(">>>>>>>>>>>>>>>>>>>>>> default");
  }

  Lotto.init(this.lottoNumbers, this.countByWinNumbers, this.historyGrade, this.numberSum, this.oddAndEvenRate);

  factory Lotto.fromJson(Map<String, dynamic> json) {
    return Lotto.init(json['lottoNumbers'], json['countByWinNumbers'], json['historyGrade'], json['numberSum'], json['oddAndEvenRate']);
  }
}

