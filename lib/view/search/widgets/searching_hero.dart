import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:marvel_guide/core/app_images.dart';

class SearchingHero extends StatefulWidget {
  const SearchingHero({Key? key}) : super(key: key);

  @override
  State<SearchingHero> createState() => _SearchingHeroState();
}

class _SearchingHeroState extends State<SearchingHero>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Lottie.asset(
          AppImages.ironManLoading,
          repeat: true,
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}
