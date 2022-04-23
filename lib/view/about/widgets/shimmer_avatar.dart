import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/app_colors.dart';

class ShimmerAvatar extends StatelessWidget {
  const ShimmerAvatar({Key? key}) : super(key: key);

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
