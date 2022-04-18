import 'package:flutter/material.dart';

import '../model/hero_model.dart';
import '../repository/home_repository.dart';

class HomeController with ChangeNotifier {
  HomeController({
    required this.repository,
  });

  final HomeRepository repository;
  final ScrollController scrollController = ScrollController();

  List<HeroModel> heroes = [];

  Future<String> getUserName() async {
    try {
      return await repository.fetchUsername();
    } catch (e) {
      return 'Fã da Marvel';
    }
  }

  Future<bool> logout() async {
    try {
      return await repository.doLogout();
    } catch (e) {
      return false;
    }
  }

  Future<void> fetchHeroes() async {
    var heroesJson = await repository.fetchHeroes();

    for (var hero in heroesJson) {
      heroes.add(HeroModel.fromMap(hero));
    }
    notifyListeners();
  }
}
