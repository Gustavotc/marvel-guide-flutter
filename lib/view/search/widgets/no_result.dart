import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:marvel_guide/core/app_images.dart';

class NoResult extends StatefulWidget {
  const NoResult({Key? key}) : super(key: key);

  @override
  State<NoResult> createState() => _NoResultState();
}

class _NoResultState extends State<NoResult> with TickerProviderStateMixin {
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            AppImages.noResult,
            repeat: true,
            width: 200,
            height: 200,
          ),
          Text(
            'Nenhum resultado...',
            style: Theme.of(context).textTheme.bodyLarge,
          )
        ],
      ),
    );
  }
}
