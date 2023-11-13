class LottoSummary{
  int lottoId = 0;
  String firstAmount = "";
  int firstWinners = 0;
  String secondAmount = "";
  int secondWinners = 0;
  String thirdAmount = "";
  int thirdWinners = 0;
  // int fourthWinners = 0;
  // int fifthWinners = 0;

  LottoSummary.init(
        this.lottoId
      , this.firstAmount
      , this.firstWinners
      , this.secondAmount
      , this.secondWinners
      , this.thirdAmount
      , this.thirdWinners
      // , this.fourthWinners
      // , this.fifthWinners
      );

  factory LottoSummary.fromJson(Map<String, dynamic> json) {
    return LottoSummary.init(
          json['lottoId']
        , json['firstAmount']
        , json['firstWinners']
        , json['secondAmount']
        , json['secondWinners']
        , json['thirdAmount']
        , json['thirdWinners']
        // , json['fourthWinners']
        // , json['fifthWinners']
    );
  }
}

