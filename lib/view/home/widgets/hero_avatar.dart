import 'package:flutter/material.dart';

import '../../../core/app_colors.dart';

class HeroAvatar extends StatelessWidget {
  final String imagePath;
  const HeroAvatar({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 40,
      backgroundColor: AppColors.darkRed,
      backgroundImage: NetworkImage('$imagePath/standard_medium.jpg'),
    );
  }
}
