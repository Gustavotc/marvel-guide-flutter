import 'package:flutter/material.dart';
import 'package:marvel_guide/controller/login_controller.dart';
import 'package:marvel_guide/core/app_colors.dart';
import 'package:marvel_guide/core/app_images.dart';
import 'package:marvel_guide/repository/login_repository.dart';
import 'package:marvel_guide/view/login/widgets/signup_text.dart';
import 'package:marvel_guide/route/route.dart' as route;

import '../widgets/custom_text_field.dart';
import '../widgets/rounded_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginController controller;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    controller = LoginController(repository: LoginRepository());
  }

  _loginSucces(String userName) {
    Navigator.pushNamedAndRemoveUntil(context, route.home, (_) => false);
  }

  _loginError() {
    const snackBar = SnackBar(
      content: Text('Usuário ou senha incorreto'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _handleSignIn() async {
    setState(() {
      isLoading = true;
    });
    String? loggedUser = await controller.login();
    if (loggedUser != null) {
      _loginSucces(loggedUser);
    } else {
      _loginError();
    }
    setState(() {
      isLoading = false;
    });
  }

  String? _emailValidator(String? value) {
    if (value!.isEmpty) {
      return 'Este campo é obrigatório';
    } else if (!value.contains('@')) {
      return 'Email inválido, deve conter @';
    }
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value!.isEmpty) {
      return 'Este campo é obrigatório';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Image.asset(AppImages.avengers, width: 200, fit: BoxFit.cover),
                const SizedBox(height: 32),
                Form(
                  key: controller.formKey,
                  child: Column(
                    children: <Widget>[
                      CustomTextField(
                        label: 'email',
                        onSave: controller.userEmail,
                        validator: _emailValidator,
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        label: 'senha',
                        onSave: controller.userPassword,
                        validator: _passwordValidator,
                        password: true,
                      ),
                      const SizedBox(height: 16),
                      RoundedButton(
                        text: 'Entrar',
                        onPress: _handleSignIn,
                        isLoading: isLoading,
                      ),
                      const SizedBox(height: 16),
                      const SignUpText()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
