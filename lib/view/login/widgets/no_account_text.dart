import 'package:flutter/material.dart';
import 'package:marvel_guide/route/route.dart' as route;

class NoAccountText extends StatelessWidget {
  const NoAccountText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.pushNamedAndRemoveUntil(context, route.home, (_) => false),
      child: Text(
        'Entrar sem conta',
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
