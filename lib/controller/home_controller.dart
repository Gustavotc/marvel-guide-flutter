import 'package:firebase_auth/firebase_auth.dart';
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
    if (FirebaseAuth.instance.currentUser != null) {
      try {
        return await repository.doLogout();
      } catch (e) {
        return false;
      }
    }
    return true;
  }

  Future<bool> fetchHeroes() async {
    var heroesJson = await repository.fetchHeroes();

    if (heroesJson != null) {
      for (var hero in heroesJson) {
        heroes.add(HeroModel.fromMap(hero));
      }
      notifyListeners();
      return true;
    }
    return false;
  }
}
