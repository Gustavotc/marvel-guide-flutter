import 'package:firebase_auth/firebase_auth.dart';
import 'package:marvel_guide/model/user_model.dart';
import 'package:marvel_guide/service/firebase_service.dart';
import 'package:marvel_guide/service/marvel_api.dart';

class HomeRepository {
  final MarvelApi api = MarvelApi();

  int fetchedHeroes = 0;
  int totalHeroes = 0;

  Future<String> fetchUsername() async {
    try {
      Map<String, dynamic> response =
          await FirebaseService.getUser() as Map<String, dynamic>;
      UserModel res = UserModel.fromMap(response);
      return res.name;
    } catch (e) {
      return 'Fã da Marvel';
    }
  }

  Future<bool> doLogout() async {
    if (FirebaseAuth.instance.currentUser != null) {
      await FirebaseService.signOutUser();
      return true;
    } else {
      return false;
    }
  }

  Future<List<dynamic>?> fetchHeroes() async {
    if (totalHeroes == 0 || totalHeroes > fetchedHeroes) {
      var data = await api.getHeroes(offset: fetchedHeroes);
      if (data != null) {
        totalHeroes = data['total'];
        fetchedHeroes += data['count'] as int;
        return data['results'];
      }
    }
    return null;
  }
}
