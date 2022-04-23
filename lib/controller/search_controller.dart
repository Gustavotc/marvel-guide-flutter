import 'package:flutter/material.dart';

import '../model/hero_model.dart';
import '../repository/search_repository.dart';

class SearchController with ChangeNotifier {
  final SearchRepository repository;
  final ScrollController scrollController = ScrollController();

  SearchController({
    required this.repository,
  });

  List<HeroModel> heroes = [];

  Future<bool> fetchHeroes(String name) async {
    var heroesJson = await repository.doSearch(name);

    if (heroesJson != null) {
      for (var hero in heroesJson) {
        heroes.add(HeroModel.fromMap(hero));
      }
      notifyListeners();
      return true;
    }
    return false;
  }

  resetSearch() {
    heroes.clear();
    repository.resetValues();
    notifyListeners();
  }
}
