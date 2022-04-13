import '../model/hero_model.dart';
import '../repository/search_repository.dart';

class SearchController {
  final SearchRepository repository;
  SearchController({
    required this.repository,
  });

   Future<List<HeroModel>> fetchHeroes(String name) async {
    return await repository.doSearch(name);
  }
}
