import 'package:localstorage/localstorage.dart';
import 'package:marvel_guide/model/user_model.dart';
import 'package:marvel_guide/service/marvel_api.dart';

class HomeRepository {
  final LocalStorage storage = LocalStorage('marvel_app');
  final MarvelApi api = MarvelApi();

  int fetchedHeroes = 0;
  int totalHeroes = 0;

  Future<String> fetchUsername() async {
    try {
      await storage.ready;
      var storagedUser = storage.getItem('user');
      if (storagedUser == null) {
        return 'Fã da Marvel';
      }
      UserModel res = UserModel.fromMap(storagedUser);
      return res.name;
    } catch (e) {
      return 'Fã da Marvel';
    }
  }

  Future<bool> doLogout() async {
    try {
      await storage.setItem('logged', false);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<dynamic>> fetchHeroes() async {
      var data = await api.getHeroes(offset: fetchedHeroes);
      totalHeroes = data['total'];
      fetchedHeroes += data['count'] as int;
      return data['results'] as List<dynamic>;
  }
}
