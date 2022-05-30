import 'package:marvel_guide/model/user_model.dart';
import 'package:marvel_guide/service/firebase_service.dart';

class LoginRepository {
  Future<String?> doLogin(UserModel user) async {
    try {
      var response = await FirebaseService.authenticateUser(user);
      return response?.user?.displayName ?? '';
    } catch (e) {
      return null;
    }
  }
}
