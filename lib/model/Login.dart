class Login{
  int id = 0;
  String loginId = "";
  String nickname = ""; // nickName
  String password = "";
  String token = "";

  Login(){
    print(">>>>>>>>>>>>>>>>>>>>>> default");
  }

  Login.init(this.id
      , this.loginId
      , this.nickname
      , this.password
      , this.token
      );

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login.init(
          json['id']
        , json['loginId']
        , json['nickname']
        , json['password']
        , json['token']
    );
  }
}

