import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  static final _db = FirebaseFirestore.instance;

  static getUser(String userId) async {
    CollectionReference users = _db.collection('users');
    users.doc(userId).get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document data: ${documentSnapshot.data()}');
      } else {
        print('Document does not exist on the database');
      }
    });
  }
}
