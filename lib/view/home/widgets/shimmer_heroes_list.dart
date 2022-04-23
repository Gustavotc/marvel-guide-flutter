import 'package:flutter/material.dart';
import 'package:marvel_guide/core/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerHeroesList extends StatelessWidget {
  const ShimmerHeroesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => Shimmer.fromColors(
          highlightColor: AppColors.red,
          baseColor: AppColors.darkRed,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              width: double.infinity,
              height: 100,
            ),
          ),
        ),
      ),
    );
  }
}
