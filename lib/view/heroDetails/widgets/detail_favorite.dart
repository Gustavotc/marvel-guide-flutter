import 'package:flutter/material.dart';
import 'package:marvel_guide/core/app_colors.dart';
import 'package:marvel_guide/service/firebase_service.dart';

class DetailFavorite extends StatelessWidget {
  final int id;
  final bool isFavorite;

  const DetailFavorite({
    Key? key,
    required this.isFavorite,
    required this.id,
  }) : super(key: key);

  _handleOnPress() {
    FirebaseService.saveFavorite(id);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 370,
      right: 8,
      child: Container(
          decoration: BoxDecoration(
            color: AppColors.grey,
            borderRadius: BorderRadius.circular(30),
          ),
          height: 60,
          width: 60,
          child: Center(
            child: IconButton(
              color: isFavorite ? AppColors.red : Colors.white,
              splashRadius: 1,
              icon: const Icon(Icons.favorite),
              onPressed: _handleOnPress,
            ),
          )),
    );
  }
}
