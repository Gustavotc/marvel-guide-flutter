import 'package:flutter/material.dart';
import 'package:marvel_guide/view/about/widgets/shimmer_avatar.dart';

import '../../../core/app_colors.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Image.network(
        width: 100,
        height: 100,
        'https://github.com/gustavotc.png',
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const ShimmerAvatar();
        },
      ),
    );
  }
}
