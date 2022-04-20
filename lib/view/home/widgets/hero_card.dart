import 'package:flutter/material.dart';
import 'package:marvel_guide/view/home/widgets/hero_avatar.dart';
import 'package:marvel_guide/view/home/widgets/hero_description.dart';
import 'package:marvel_guide/view/home/widgets/hero_name.dart';

import '../../../core/app_colors.dart';

class HeroCard extends StatelessWidget {
  final String name;
  final String description;
  final String imagePath;

  const HeroCard({
    Key? key,
    required this.name,
    required this.imagePath,
    required this.description,
  }) : super(key: key);

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
            bottomRight: Radius.circular(10),
          ),
        ),
        height: 100,
        child: Row(
          children: [
            HeroAvatar(imagePath: imagePath),
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeroName(name: name),
                      HeroDescription(text: description),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
