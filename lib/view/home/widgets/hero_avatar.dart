import 'package:flutter/material.dart';
import 'package:marvel_guide/view/home/widgets/shimmer_hero_avatar.dart';

class HeroAvatar extends StatelessWidget {
  final String imagePath;

  const HeroAvatar({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      '$imagePath/standard_medium.jpg',
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return const ShimmerHeroAvatar();
      },
      errorBuilder: (context, error, stackTrace) {
        return Container(
          height: 100,
          width: 100,
          color: Colors.black,
          child: const Center(
            child: Text(
              'Imagem indisponível',
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }
}
