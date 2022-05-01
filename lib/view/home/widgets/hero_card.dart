import 'package:flutter/material.dart';

import 'package:marvel_guide/model/hero_model.dart';
import 'package:marvel_guide/route/route.dart' as route;
import 'package:marvel_guide/view/home/widgets/hero_avatar.dart';
import 'package:marvel_guide/view/home/widgets/hero_description.dart';
import 'package:marvel_guide/view/home/widgets/hero_name.dart';

import '../../../core/app_colors.dart';

class HeroCard extends StatelessWidget {
  final HeroModel hero;

  const HeroCard({
    Key? key,
    required this.hero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () =>
            Navigator.pushNamed(context, route.heroDetails, arguments: hero),
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
              HeroAvatar(id: hero.id, imagePath: hero.imageUrl),
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
                        HeroName(name: hero.name),
                        HeroDescription(text: hero.description),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
