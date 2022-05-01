import 'package:marvel_guide/model/comic_model.dart';
import 'package:marvel_guide/repository/hero_details_repository.dart';

class HeroDetailsController {
  final HeroDetailsRepository repository;
  final List<ComicModel> comicsList = [];

  HeroDetailsController({
    required this.repository,
  });

  Future<bool> fetchHeroComics(int heroId) async {
    try {
      var comics = await repository.fetchHeroComics(heroId);
      if (comics != null) {
        for (var comic in comics) {
          comicsList.add(ComicModel.fromMap(comic));
        }
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}
