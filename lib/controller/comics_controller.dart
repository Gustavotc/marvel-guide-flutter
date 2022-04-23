import 'package:flutter/material.dart';
import 'package:marvel_guide/model/comic_model.dart';

import '../repository/comics_repository.dart';

class ComicsController with ChangeNotifier {
  final ComicsRepository repository;
  final ScrollController scrollController = ScrollController();

  List<ComicModel> comics = [];

  ComicsController({required this.repository});

  Future<bool> fetchComics() async {
    var comicsJson = await repository.fetchComics();
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
