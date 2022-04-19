import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:marvel_guide/model/hero_model.dart';

import '../home/widgets/custom_progress_indicator.dart';
import '../home/widgets/hero_card.dart';

class HeroesList extends StatelessWidget {
  final Listenable animation;
  final ScrollController scrollController;
  final ValueListenable<bool> loading;
  final List<HeroModel> heroes;

  const HeroesList({
    Key? key,
    required this.animation,
    required this.scrollController,
    required this.loading,
    required this.heroes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, snapshot) {
        return Stack(
          children: [
            ListView.builder(
              controller: scrollController,
              itemCount: heroes.length,
              itemBuilder: (context, index) {
                final hero = heroes[index];
                return HeroCard(
                  name: hero.name,
                  imagePath: hero.imageUrl,
                );
              },
            ),
            CustomProgressIndicator(
              loading: loading,
            ),
          ],
        );
      },
    );
  }
}
