import 'package:flutter/material.dart';
import 'package:marvel_guide/core/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerHeroComics extends StatelessWidget {
  const ShimmerHeroComics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 400,
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            highlightColor: AppColors.red,
            baseColor: AppColors.darkRed,
            child: Container(
              margin: const EdgeInsets.all(8),
              color: Colors.grey,
              height: 400,
              width: 100,
            ),
          );
        },
      ),
    );
  }
}
