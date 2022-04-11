import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeveloperWordsText extends StatelessWidget {
  const DeveloperWordsText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '''“Este aplicativo foi  criado com o intuito de compartilhar uma de minhas paixões, que é o universo Marvel. 
Meu objetivo é aproximar mais pessoas a esse universo e alimentar  o conhecimento dos fãs”.''',
      style: GoogleFonts.kalam(
        fontSize: 20,
        fontStyle: FontStyle.italic,
        color: Colors.white,
      ),
      textAlign: TextAlign.justify,
    );
  }
}
