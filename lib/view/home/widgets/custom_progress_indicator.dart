import 'package:flutter/material.dart';
import 'package:marvel_guide/core/app_colors.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Flexible(
      child: Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: AppColors.darkRed,
        ),
      ),
    );
  }
}
