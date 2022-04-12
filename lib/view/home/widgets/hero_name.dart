import 'package:flutter/material.dart';

class HeroName extends StatelessWidget {
  final String name;
  const HeroName({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Text(
        name,
        style: theme.bodyLarge,
      ),
    );
  }
}
