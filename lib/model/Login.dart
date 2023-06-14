class Login{
  int id = 0;
  String loginID = "";
  String nickName = "";
  String password = "";

  Login(){
    print(">>>>>>>>>>>>>>>>>>>>>> default");
  }

  Login.init(this.id
      , this.loginID
      , this.nickName
      , this.password
      );

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login.init(json['id']
        , json['loginID']
        , json['nickName']
        , json['password']
    );
  }
}

