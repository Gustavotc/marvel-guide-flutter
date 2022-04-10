import 'package:localstorage/localstorage.dart';
import 'package:marvel_guide/model/user_model.dart';

class LoginRepository {
  Future<String?> doLogin(UserModel user) async {
    final LocalStorage storage = LocalStorage('marvel_app');
    try {
      await storage.ready;
      await Future.delayed(const Duration(seconds: 1));
      var storagedUser = await storage.getItem('user');
      if(storagedUser == null) {
        return null;
      }
      UserModel res = UserModel.fromMap(storagedUser);

      if (user.email == res.email && user.password == res.password) {
        return res.name;
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}