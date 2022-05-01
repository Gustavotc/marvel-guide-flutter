import 'package:flutter/material.dart';
import 'package:marvel_guide/model/comic_model.dart';
import 'package:marvel_guide/view/heroDetails/widgets/detail_hero_name.dart';
import 'package:marvel_guide/view/heroDetails/widgets/hero_detail_image.dart';

class ComicDetailsScreen extends StatelessWidget {
  final ComicModel comic;

  const ComicDetailsScreen({Key? key, required this.comic}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(comic.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 430,
              child: Stack(
                children: [
                  DetailImage(
                    id: comic.id,
                    imageUrl: comic.imageUrl,
                  ),
                  DetailTitle(
                    name: comic.title,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Número de páginas: ${comic.pageCount != 0 ? comic.pageCount : 'Não informado'}',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
