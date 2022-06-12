import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:marvel_guide/model/favorite_model.dart';
import 'package:marvel_guide/model/user_model.dart';
import 'package:marvel_guide/store/favorites_store.dart';

class FirebaseService {
  static final _db = FirebaseFirestore.instance;
  static final _auth = FirebaseAuth.instance;

  static Future<UserCredential?> createUser(UserModel user) async {
    return _auth.createUserWithEmailAndPassword(
      email: user.email,
      password: user.password,
    );
  }

  static Future<bool> saveUserInfo(UserModel user) async {
    try {
      String? userId = _auth.currentUser?.uid;
      if (userId != null) {
        await _db.collection('users').doc(userId).set(user.toMap());
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  static Future<UserCredential?> authenticateUser(UserModel user) async {
    return await _auth.signInWithEmailAndPassword(
      email: user.email,
      password: user.password,
    );
  }

  static Future<Object?> getUser() async {
    String? userId = _auth.currentUser?.uid;

    if (userId != null) {
      CollectionReference users = _db.collection('users');
      DocumentSnapshot documentSnapshot = await users.doc(userId).get();
      if (documentSnapshot.exists) {
        return documentSnapshot.data();
      } else {
        return null;
      }
    }
    return null;
  }

  static Future<bool> saveFavorite(int id, {bool isHero = true}) async {
    String? userId = _auth.currentUser?.uid;

    if (userId == null) return false;

    FavoriteModel? favorites = FavoritesStore.instance.favorites;

    if (isHero) {
      if (favorites?.heroes != null) {
        favorites!.heroes!.contains(id)
            ? favorites.heroes!.remove(id)
            : favorites.heroes!.add(id);
      }
    } else {
      if (favorites?.comics != null) {
        favorites!.comics!.contains(id)
            ? favorites.comics!.remove(id)
            : favorites.comics!.add(id);
      }
    }

    CollectionReference ref = _db.collection('favorites');

    try {
      isHero
          ? await ref.doc(userId).update({'heroes': favorites?.heroes})
          : await ref.doc(userId).update({'comics': favorites?.comics});
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<FavoriteModel?> getFavorites() async {
    String? userId = _auth.currentUser?.uid;

    if (userId == null) return null;

    CollectionReference ref = _db.collection('favorites');

    try {
      DocumentSnapshot heroesSnapshot = await ref.doc(userId).get();
      if (heroesSnapshot.exists) {
        Map<String, dynamic> response =
            heroesSnapshot.data() as Map<String, dynamic>;

        return FavoriteModel.fromMap(response);
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  static signOutUser() async {
    await _auth.signOut();
  }
}
