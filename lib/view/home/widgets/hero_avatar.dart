import 'package:flutter/material.dart';

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
