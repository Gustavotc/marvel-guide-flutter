import '../model/hero_model.dart';
import '../service/marvel_api.dart';

class SearchRepository {
  final MarvelApi api = MarvelApi();

  Future<List<HeroModel>> doSearch(String name) async {
    List<HeroModel> heroes = [];
    var heroesJson = await api.getHeroes(name: name);

    for (var hero in heroesJson) {
      heroes.add(HeroModel.fromMap(hero));
    }
    return heroes;
  }
}
