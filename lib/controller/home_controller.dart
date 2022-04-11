import '../repository/home_repository.dart';

class HomeController {
  HomeController({
    required this.repository,
  });

  final HomeRepository repository;

  Future<String> getUserName() async {
    try {
      return await repository.fetchUsername();
    } catch(e) {
      return 'Fã da Marvel';
    }
  }

  Future<bool>logout() async {
    try {
      return await repository.doLogout();
    } catch (e) {
      return false;
    }
  }
}
