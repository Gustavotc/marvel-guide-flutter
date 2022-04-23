import '../service/marvel_api.dart';

class ComicsRepository {
  final MarvelApi api = MarvelApi();

  int fetchedComics = 0;
  int totalComics = 0;

  Future<List<dynamic>?> fetchComics() async {
    if (fetchedComics == 0 || totalComics > fetchedComics) {
      var data = await api.getComics(offset: fetchedComics);
      if (data != null) {
        totalComics = data['total'];
        fetchedComics += data['count'] as int;
        return data['results'] as List<dynamic>;
      }
    }
    return null;
  }
}
