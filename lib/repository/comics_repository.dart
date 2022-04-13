import 'package:marvel_guide/model/comic_model.dart';

import '../service/marvel_api.dart';

class ComicsRepository {
  final MarvelApi api = MarvelApi();

  Future<List<ComicModel>> fetchComics() async {
    List<ComicModel> comics = [];
    var comicsJson = await api.getComics();

    for (var comic in comicsJson) {
      comics.add(ComicModel.fromMap(comic));
    }

    return comics;
  }
}
