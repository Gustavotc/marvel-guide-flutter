import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailHeroDescription extends StatelessWidget {
  final String text;

  const DetailHeroDescription({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text == '' ? 'Sem descrição' : text,
        style: GoogleFonts.marvel(
          textStyle: Theme.of(context).textTheme.bodyLarge,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
