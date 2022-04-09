import 'package:flutter/material.dart';
import 'package:marvel_guide/repository/signup_repository.dart';

import '../../controller/signup_controller.dart';
import '../../core/app_colors.dart';
import '../../core/app_images.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/rounded_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late SignupController controller;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    controller = SignupController(repository: SignupRepository());
  }

  _loginSucces() {
    print('SUCESSO');
  }

  _loginError() {
    const snackBar = SnackBar(
      content: Text('Dados inválidos'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _handleSignUp() async {
    setState(() {
      isLoading = true;
    });
    if (await controller.register()) {
      _loginSucces();
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
                Image.asset(AppImages.signup, width: 200, fit: BoxFit.cover),
                const SizedBox(height: 16),
                Form(
                  key: controller.formKey,
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 16),
                      CustomTextField(
                        label: 'nome',
                        onSave: controller.userName,
                        validator: _passwordValidator,
                      ),
                      const SizedBox(height: 16),
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
                      ),
                      const SizedBox(height: 16),
                      RoundedButton(
                        text: 'Cadastrar',
                        onPress: _handleSignUp,
                        isLoading: isLoading,
                      ),
                      const SizedBox(height: 16),
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
