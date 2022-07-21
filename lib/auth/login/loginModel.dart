class logInModel {
  int? id;
  String? username;
  String? password;
  String? token;

  logInModel({this.id, this.username, this.token,this.password});

  logInModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    token = json['token'];
  }

}
