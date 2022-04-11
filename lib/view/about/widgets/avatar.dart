import 'package:flutter/material.dart';

import '../../../core/app_colors.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 40,
      backgroundColor: AppColors.black,
      backgroundImage: NetworkImage('https://github.com/gustavotc.png'),
    );
  }
}
