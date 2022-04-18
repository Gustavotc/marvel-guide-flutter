import 'package:flutter/material.dart';
import 'package:marvel_guide/model/comic_model.dart';

import '../repository/comics_repository.dart';

class ComicsController with ChangeNotifier {
  final ComicsRepository repository;
  final ScrollController scrollController = ScrollController();

  List<ComicModel> comics = [];

  ComicsController({required this.repository});

  Future<void> fetchComics() async {
   var comicJson = await repository.fetchComics();
    for (var comic in comicJson) {
      comics.add(ComicModel.fromMap(comic));
    }

    notifyListeners();
  }
}
