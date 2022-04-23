import 'package:flutter/material.dart';
import 'package:marvel_guide/core/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerHeroAvatar extends StatelessWidget {
  const ShimmerHeroAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: Container(
        width: 100,
        height: 100,
        color: AppColors.darkRed,
      ),
      baseColor: AppColors.darkRed,
      highlightColor: AppColors.red,
    );
  }
}
