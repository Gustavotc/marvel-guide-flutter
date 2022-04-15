import 'package:flutter/material.dart';

class ComicCard extends StatelessWidget {
  final String title;
  final String imagePath;

  const ComicCard({Key? key, required this.title, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black54,
      ),
      child: Column(
        children: <Widget>[
          Expanded(
              child: Image.network(
            '$imagePath/portrait_xlarge.jpg',
            fit: BoxFit.cover,
          )),
          Text(
            title,
            textAlign: TextAlign.justify,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
