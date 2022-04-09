import 'package:flutter/material.dart';

class SignUpText extends StatelessWidget {
  const SignUpText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Não tem conta?',
          style: TextStyle(color: Colors.white30),
        ),
        TextButton(
          onPressed: () => {},
          child: const Text(
            'Cadastre-se agora!',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        )
      ],
    );
  }
}
