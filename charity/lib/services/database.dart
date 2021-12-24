import 'package:charity/models/charity_info.dart';
import 'package:charity/models/favorite_charity.dart';
import 'package:charity/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> createNewUser(UserModel user) async {
    try {
      await _firestore.collection('users').doc(user.id).set({
        "date": user.date,
      });

      await _firestore.collection('users').doc(user.id).collection('location').doc().set(
        {
          "streetNumber": user.place?.streetNumber,
          "street": user.place?.street,
          "city": user.place?.city,
          "state": user.place?.state,
          "zipCode": user.place?.zipCode,
        },
      );

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> addFavorite(String uid, Charity charity) async {
    try {
      await _firestore.collection("users").doc(uid).collection("favorites").doc("${charity.ein}").set({
        'title': "${charity.charityName}",
        'ein': "${charity.ein}",
        'category': "${charity.category!.categoryName}",
        'date': Timestamp.now(),
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> removeFavorite(String uid, Charity charity) async {
    try {
      await _firestore.collection("users").doc(uid).collection("favorites").doc("${charity.ein}").delete();
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Stream<List<FavoriteCharity>> favoritesStream(String uid) {
    Stream<QuerySnapshot> stream = _firestore.collection("users").doc(uid).collection("favorites").snapshots();

    return stream.map((query) => query.docs.map((doc) => FavoriteCharity.fromDocumentSnapshot(doc)).toList());
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot doc = await _firestore.collection("users").doc(uid).get();
      DocumentSnapshot locDoc = await _firestore.collection("users").doc(uid).collection("location").doc().get();
      return UserModel.fromDocumentSnapshot(doc, locDoc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
