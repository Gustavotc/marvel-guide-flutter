import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_guide/model/comic_model.dart';
import 'package:marvel_guide/route/route.dart' as route;

class ComicCard extends StatelessWidget {
  final ComicModel comic;

  const ComicCard({Key? key, required this.comic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed(context, route.comicDetails, arguments: comic),
      child: Container(
        width: 100,
        decoration: const BoxDecoration(
          color: Colors.black54,
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Hero(
                tag: 'heroImage:${comic.id}',
                child: Image.network(
                  '${comic.imageUrl}/portrait_xlarge.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              comic.title,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: GoogleFonts.marvel(
                  textStyle: Theme.of(context).textTheme.bodySmall),
            ),
          ],
        ),
      ),
    );
  }
}
