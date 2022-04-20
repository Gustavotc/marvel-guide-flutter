import 'package:flutter/material.dart';

class HeroDescription extends StatelessWidget {
  final String text;

  const HeroDescription({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      (text != '' ? text : 'Sem descrição'),
      style: Theme.of(context).textTheme.bodySmall,
      textAlign: TextAlign.justify,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}
