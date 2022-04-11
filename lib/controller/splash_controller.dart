import '../repository/splash_repository.dart';

class SplashController {
  final SplashRepository repository;
  SplashController({
    required this.repository,
  });

  Future<bool> checkLogin() async {
    try {
      return await repository.checkLogin();
    } catch (e) {
      return false;
    }
  }
}
