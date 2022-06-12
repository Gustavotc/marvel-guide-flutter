import 'package:flutter/material.dart';

import 'package:marvel_guide/core/app_colors.dart';
import 'package:marvel_guide/service/firebase_service.dart';
import 'package:marvel_guide/store/favorites_store.dart';

class DetailFavorite extends StatefulWidget {
  final int id;
  final bool isHero;

  const DetailFavorite({
    Key? key,
    required this.id,
    required this.isHero,
  }) : super(key: key);

  @override
  State<DetailFavorite> createState() => _DetailFavoriteState();
}

class _DetailFavoriteState extends State<DetailFavorite> {
  _handleOnPress() {
    //TO-DO Check if user is signed in
    FirebaseService.saveFavorite(widget.id, isHero: widget.isHero);
    setState(() {});
  }

  bool checkIsFavorite() {
    if (widget.isHero) {
      return FavoritesStore.instance.favorites?.heroes?.contains(widget.id) ??
          false;
    } else {
      return FavoritesStore.instance.favorites?.comics?.contains(widget.id) ??
          false;
    }
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
              color: checkIsFavorite() ? AppColors.red : Colors.white,
              splashRadius: 1,
              icon: const Icon(Icons.favorite),
              onPressed: _handleOnPress,
            ),
          )),
    );
  }
}
