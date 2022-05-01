import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/app_colors.dart';

class ShimmerHeroImage extends StatelessWidget {
  const ShimmerHeroImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: AppColors.red,
      baseColor: AppColors.darkRed,
      child: Container(
        color: Colors.grey,
        width: double.infinity,
        height: 400,
      ),
    );
  }
}
