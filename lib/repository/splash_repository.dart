import 'package:firebase_auth/firebase_auth.dart';

class SplashRepository {
  Future<bool> checkLogin() async {
    return FirebaseAuth.instance.currentUser != null ? true : false;
  }
}
