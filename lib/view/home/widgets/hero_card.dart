import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvel_guide/core/app_colors.dart';

import 'hero_avatar.dart';
import 'hero_name.dart';

class HeroCard extends StatelessWidget {
  final String name;
  final String imagePath;
  const HeroCard({Key? key, required this.name, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white70),
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10))),
        height: 100,
        child: Row(
          children: [
            Image.network(
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
            ),
            // HeroAvatar(imagePath: imagePath),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.darkRed,
                      AppColors.red,
                    ],
                  ),
                ),
                alignment: Alignment.centerLeft,
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    name,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
            )
            // Expanded(child: HeroName(name: name)),
          ],
        ),
      ),
    );
  }
}
