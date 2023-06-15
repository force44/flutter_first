class Login{
  int id = 0;
  String loginId = "";
  String nickName = ""; // nickName
  String password = "";
  String token = "";

  Login(){
    print(">>>>>>>>>>>>>>>>>>>>>> default");
  }

  Login.init(this.id
      , this.loginId
      , this.nickName
      , this.password
      , this.token
      );

  factory Login.fromJson(Map<String, dynamic> json) {
    print(json);
    return Login.init(json['id']
        , json['loginId']
        , json['nickName']
        , json['password']
        , json['token']
    );
  }
}

