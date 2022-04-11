import 'package:localstorage/localstorage.dart';

class SplashRepository {
  Future<bool> checkLogin() async {
    final LocalStorage storage = LocalStorage('marvel_app');
    try {
      await storage.ready;
      return storage.getItem('logged') ?? false;
    } catch (e) {
      return false;
    }
  }
}
