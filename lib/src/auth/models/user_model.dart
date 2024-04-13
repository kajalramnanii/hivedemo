class UserModel {
  UserModel({
    this.id,
    this.userName,
    this.email,
    this.password,
  });

  UserModel.fromJson(dynamic json) {
    id = json['id'];
    userName = json['user_name'];
    email = json['email'];
    password = json['password'];
  }
  num? id;
  String? userName;
  String? email;
  String? password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_name'] = userName;
    map['email'] = email;
    map['password'] = password;
    return map;
  }
}
