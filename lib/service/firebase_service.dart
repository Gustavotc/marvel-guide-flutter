import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:marvel_guide/model/favorite_model.dart';
import 'package:marvel_guide/model/user_model.dart';

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

    String refName = isHero ? 'heroes' : 'comics';

    CollectionReference ref = _db.collection('favorites/$userId/$refName');

    try {
      await ref.add(FavoriteModel(id).toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

  static signOutUser() async {
    await _auth.signOut();
  }
}
