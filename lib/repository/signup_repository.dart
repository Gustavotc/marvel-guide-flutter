import 'package:firebase_auth/firebase_auth.dart';
import 'package:marvel_guide/model/user_model.dart';
import 'package:marvel_guide/service/firebase_service.dart';

class SignupRepository {
  Future<String?> doRegister(UserModel user) async {
    try {
      await FirebaseService.createUser(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'A senha deve ser mais forte.';
      } else if (e.code == 'email-already-in-use') {
        return 'E-mail já existente';
      }
    } catch (e) {
      return 'Algo deu errado tente novamente';
    }

    if (await FirebaseService.saveUserInfo(user)) {
      return null;
    } else {
      return 'Algo deu errado tente novamente';
    }
  }
}
