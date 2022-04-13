import '../repository/comics_repository.dart';

class ComicsController {
  final ComicsRepository repository;

  ComicsController({required this.repository});

  Future<List> fetchComics() async {
    return await repository.fetchComics();
  }
}
