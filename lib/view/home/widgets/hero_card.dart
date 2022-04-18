import 'package:flutter/material.dart';
import 'package:marvel_guide/view/home/widgets/hero_avatar.dart';
import 'package:marvel_guide/view/home/widgets/hero_name.dart';

class HeroCard extends StatelessWidget {
  final String name;
  final String imagePath;

  const HeroCard({
    Key? key,
    required this.name,
    required this.imagePath,
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
            HeroName(name: name),
          ],
        ),
      ),
    );
  }
}
