import 'package:flutter/material.dart';

import 'package:marvel_guide/model/user_model.dart';
import 'package:marvel_guide/repository/login_repository.dart';

class LoginController {
  LoginController({
    required this.repository,
  });

  final formKey = GlobalKey<FormState>();
  final LoginRepository repository;

  UserModel user = UserModel();

  void userEmail(String? value) => user.email = value! ;
  void userPassword(String? value) => user.password = value!;

  Future<bool> login() async {
    if (!formKey.currentState!.validate()) {
      return false;
    }

    formKey.currentState?.save();

    try {
      return await repository.doLogin(user);
    } catch(e) {
      return false;
    }
  }
}
