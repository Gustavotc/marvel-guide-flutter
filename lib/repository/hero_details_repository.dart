import 'package:marvel_guide/service/marvel_api.dart';

class HeroDetailsRepository {
  final MarvelApi api = MarvelApi();

  Future<List<dynamic>?> fetchHeroComics(int heroId) async {
    var data = await api.getHeroComics(heroId);
    if (data != null) {
      return data['results'];
    }
    return null;
  }
}
