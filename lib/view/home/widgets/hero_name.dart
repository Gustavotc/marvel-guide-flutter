import 'package:flutter/material.dart';

class HeroName extends StatelessWidget {
  final String name;
  const HeroName({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: FittedBox(
        child: Text(
          name,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
