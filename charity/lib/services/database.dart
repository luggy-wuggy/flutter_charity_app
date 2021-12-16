import 'package:charity/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> createNewUser(UserModel user) async {
    try {
      await _firestore.collection('users').doc(user.id).set({
        "date": user.date,
      });

      await _firestore.collection('users').doc(user.id).collection('location').doc(user.place?.placeID).set({
        "streetNumber": user.place?.streetNumber,
        "street": user.place?.street,
        "city": user.place?.city,
        "state": user.place?.state,
        "zipCode": user.place?.zipCode,
      });

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot doc = await _firestore.collection("users").doc(uid).get();
      return UserModel.fromDocumentSnapshot(doc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
