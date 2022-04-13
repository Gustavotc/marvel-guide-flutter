import 'package:flutter/material.dart';

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
      child: Row(
        children: [
          HeroAvatar(imagePath: imagePath),
          Expanded(child: HeroName(name: name)),
        ],
      ),
    );
  }
}
