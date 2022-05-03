import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:marvel_guide/core/app_images.dart';

class EmptySearchValue extends StatefulWidget {
  const EmptySearchValue({Key? key}) : super(key: key);

  @override
  State<EmptySearchValue> createState() => _EmptySearchValueState();
}

class _EmptySearchValueState extends State<EmptySearchValue>
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Lottie.asset(
          AppImages.drStrangeGif,
          repeat: true,
        ),
        Text(
          'Pesquise por um héroi...',
          style: Theme.of(context).textTheme.bodyLarge,
        )
      ],
    );
  }
}
