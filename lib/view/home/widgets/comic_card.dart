import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ComicCard extends StatelessWidget {
  final String title;
  final String imagePath;

  const ComicCard({Key? key, required this.title, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      decoration: const BoxDecoration(
        color: Colors.black54,
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Image.network(
              '$imagePath/portrait_xlarge.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: GoogleFonts.marvel(
                textStyle: Theme.of(context).textTheme.bodySmall),
          ),
        ],
      ),
    );
  }
}
