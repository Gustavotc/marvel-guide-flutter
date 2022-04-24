import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeroDescription extends StatelessWidget {
  final String text;

  const HeroDescription({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      (text != '' ? text : 'Sem descrição'),
      style:
          GoogleFonts.marvel(textStyle: Theme.of(context).textTheme.bodySmall),
      textAlign: TextAlign.justify,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}
