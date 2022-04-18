import 'package:flutter/material.dart';

import '../../../core/app_colors.dart';

class HeroName extends StatelessWidget {
  final String name;
  const HeroName({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}
