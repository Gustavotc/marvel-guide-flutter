import 'package:localstorage/localstorage.dart';
import 'package:marvel_guide/model/user_model.dart';

class HomeRepository {
  final LocalStorage storage = LocalStorage('marvel_app');
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
}
