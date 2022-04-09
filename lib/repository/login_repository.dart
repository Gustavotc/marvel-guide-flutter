import 'package:localstorage/localstorage.dart';
import 'package:marvel_guide/model/user_model.dart';

class LoginRepository {
  String? doLogin(UserModel user) {
    final LocalStorage storage = LocalStorage('marvel_app');
    try {
      Map<String, dynamic> storagedUser = storage.getItem('user');
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