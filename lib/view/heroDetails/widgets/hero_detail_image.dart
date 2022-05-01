import 'package:flutter/material.dart';
import 'package:marvel_guide/view/heroDetails/widgets/shimmer_hero_image.dart';

class HeroDetailImage extends StatelessWidget {
  final int id;
  final String imageUrl;

  const HeroDetailImage({Key? key, required this.id, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'heroImage:$id',
      child: Image.network(
        width: double.infinity,
        height: 400,
        '$imageUrl/detail.jpg',
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const ShimmerHeroImage();
        },
        errorBuilder: (context, exception, stackTrace) {
          return Container(
            height: 400,
            color: Colors.black,
            child: const Center(
              child: Text('Imagem indisponível'),
            ),
          );
        },
      ),
    );
  }
}
