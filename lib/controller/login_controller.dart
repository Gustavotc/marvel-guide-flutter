import 'package:flutter/material.dart';

import 'package:marvel_guide/model/user_model.dart';
import 'package:marvel_guide/repository/login_repository.dart';

class LoginController {
  LoginController({
    required this.repository,
  });

  final formKey = GlobalKey<FormState>();
  final LoginRepository repository;

  UserModel user = UserModel(name: '', email: '', password: '');

  void userEmail(String? value) => user.email = value! ;
  void userPassword(String? value) => user.password = value!;

  Future<String?> login() async {
    if (!formKey.currentState!.validate()) {
      return null;
    }

    formKey.currentState?.save();

    try {
      var teste = await repository.doLogin(user);
      return teste;
    } catch(e) {
      return null;
    }
  }
}
