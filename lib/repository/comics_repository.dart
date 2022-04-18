import '../service/marvel_api.dart';

class ComicsRepository {
  final MarvelApi api = MarvelApi();

  int fetchedComics = 0;
  int totalComics = 0;

  Future<List<dynamic>> fetchComics() async {
    var data = await api.getComics(offset: fetchedComics);
    totalComics = data['total'];
    fetchedComics += data['count'] as int;
    return data['results'] as List<dynamic>;
  }
}
