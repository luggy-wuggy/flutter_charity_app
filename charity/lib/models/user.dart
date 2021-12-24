import 'package:charity/models/google_location.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  late String? id;
  late DateTime? date;
  late Place? place;

  UserModel({this.id, this.date, this.place});

  UserModel.fromDocumentSnapshot(DocumentSnapshot doc, DocumentSnapshot locDoc) {
    id = doc.id;
    date = doc['date'];
    place?.city = locDoc["city"];
    place?.state = locDoc["state"];
    place?.street = locDoc["street"];
    place?.streetNumber = locDoc["streetNumber"];
    place?.zipCode = locDoc["zipCode"];
  }
}
