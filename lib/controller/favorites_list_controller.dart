import 'package:flutter/material.dart';
import 'package:marvel_guide/model/comic_model.dart';
import 'package:marvel_guide/model/favorite_model.dart';
import 'package:marvel_guide/service/marvel_api.dart';
import 'package:marvel_guide/store/favorites_store.dart';

import '../model/hero_model.dart';

class FavoritesListController with ChangeNotifier {
  bool isHero = true;

  List<HeroModel> heroes = [];
  List<ComicModel> comics = [];
  FavoriteModel? favorites = FavoritesStore.instance.favorites;
  final ScrollController scrollController = ScrollController();
  MarvelApi api = MarvelApi();

  Future<bool> fetchFavorites() async {
    if (isHero) {
      var heroesJson = await api.getItemsById(favorites?.heroes ?? []);

      if (heroesJson != null) {
        for (var hero in heroesJson) {
          heroes.add(HeroModel.fromMap(hero));
        }
        notifyListeners();
        return true;
      }
      return false;
    } else {
      var comicsJson =
          await api.getItemsById(favorites?.comics ?? [], path: 'comics');

      if (comicsJson != null) {
        for (var comic in comicsJson) {
          comics.add(ComicModel.fromMap(comic));
        }
        notifyListeners();
        return true;
      }
      return false;
    }
  }
}
