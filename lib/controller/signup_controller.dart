import 'package:flutter/material.dart';

import 'package:marvel_guide/model/user_model.dart';

import '../repository/signup_repository.dart';

class SignupController {
  SignupController({
    required this.repository,
  });

  final formKey = GlobalKey<FormState>();
  final SignupRepository repository;

  UserModel user = UserModel(name: '', email: '', password: '');

  void userName(String? value) => user.name = value! ;
  void userEmail(String? value) => user.email = value! ;
  void userPassword(String? value) => user.password = value!;

  bool register() {
    if (!formKey.currentState!.validate()) {
      return false;
    }

    formKey.currentState?.save();

    try {
      return repository.doRegister(user);
    } catch(e) {
      return false;
    }
  }
}
