import '../service/marvel_api.dart';

class SearchRepository {
  final MarvelApi api = MarvelApi();
  int fetchedHeroes = 0;
  int totalHeroes = 0;

  Future<List<dynamic>?> doSearch(String name) async {
    if (totalHeroes == 0 || totalHeroes > fetchedHeroes) {
      var data = await api.getHeroes(offset: fetchedHeroes, name: name);
      if (data != null) {
        totalHeroes = data['total'];
        fetchedHeroes += data['count'] as int;
        return data['results'] as List<dynamic>;
      }
    }
    return null;
  }

  resetValues() {
    fetchedHeroes = 0;
    totalHeroes = 0;
  }
}
