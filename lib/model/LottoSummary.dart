class LottoSummary{
  int lottoId = 0;
  String firstAmount = "";
  String firstWinners = "";
  String secondAmount = "";
  String secondWinners = "";
  String thirdAmount = "";
  String thirdWinners = "";


  LottoSummary.init(
        this.lottoId
      , this.firstAmount
      , this.firstWinners
      , this.secondAmount
      , this.secondWinners
      , this.thirdAmount
      , this.thirdWinners
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
    );
  }
}

