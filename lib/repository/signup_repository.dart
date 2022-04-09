import 'package:localstorage/localstorage.dart';
import 'package:marvel_guide/model/user_model.dart';

class SignupRepository {
  bool doRegister(UserModel user) {
    final LocalStorage storage = LocalStorage('marvel_app');
    var jsonUser = user.toJSONEncodable();
    try {
      storage.setItem('user', jsonUser);
      return true;
    } catch (e) {
      return false;
    }
  }
}
