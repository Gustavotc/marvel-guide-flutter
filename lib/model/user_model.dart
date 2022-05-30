import 'dart:convert';

class UserModel {
  String name = '';
  String email = '';
  String password = '';

  UserModel({
    required this.name,
    required this.email,
    required this.password,
  });

  toJSONEncodable() {
    Map<String, dynamic> userMap = {};
    userMap['name'] = name;
    userMap['email'] = email;
    userMap['password'] = password;
    return userMap;
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
