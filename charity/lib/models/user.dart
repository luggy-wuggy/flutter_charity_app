import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  late String? id;
  late String? location;
  late DateTime? date;

  UserModel({this.id, this.location, this.date});

  UserModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    id = doc.id;
    location = doc['location'];
    date = doc['date'];
  }
}
