import '../service/marvel_api.dart';

class SearchRepository {
  final MarvelApi api = MarvelApi();
  int fetchedHeroes = 0;
  int totalHeroes = 0;

  Future<List<dynamic>> doSearch(String name) async {
    var data = await api.getHeroes(offset: fetchedHeroes, name: name);
      totalHeroes = data['total'];
      fetchedHeroes += data['count'] as int;
      return data['results'] as List<dynamic>;
  }
}
