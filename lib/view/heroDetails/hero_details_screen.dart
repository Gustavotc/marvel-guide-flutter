import 'package:flutter/material.dart';
import 'package:marvel_guide/model/hero_model.dart';
import 'package:marvel_guide/view/heroDetails/widgets/detail_hero_descpription.dart';
import 'package:marvel_guide/view/heroDetails/widgets/detail_hero_name.dart';
import 'package:marvel_guide/view/heroDetails/widgets/hero_detail_image.dart';

class HeroDetailsScreen extends StatelessWidget {
  final HeroModel hero;
  const HeroDetailsScreen({Key? key, required this.hero}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(hero.name),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 430,
            child: Stack(
              children: [
                HeroDetailImage(
                  id: hero.id,
                  imageUrl: hero.imageUrl,
                ),
                DetailHeroName(
                  name: hero.name,
                ),
              ],
            ),
          ),
          DetailHeroDescription(text: hero.description),
        ],
      ),
    );
  }
}
