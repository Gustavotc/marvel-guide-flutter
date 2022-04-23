import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/app_colors.dart';

class ShimmerCommicsList extends StatelessWidget {
  const ShimmerCommicsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 12,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 9 / 16,
        crossAxisCount: 3,
        mainAxisSpacing: 16,
        crossAxisSpacing: 8,
      ),
      itemBuilder: (context, index) => Shimmer.fromColors(
        highlightColor: AppColors.red,
        baseColor: AppColors.darkRed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.grey,
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}
