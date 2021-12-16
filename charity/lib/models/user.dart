import 'package:charity/services/google_location_ac.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  late String? id;
  late DateTime? date;
  late Place? place;

  UserModel({this.id, this.date, this.place});

  UserModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    id = doc.id;
    // date = doc['date'];
    // place?.placeID = doc['location'].
    // place?.streetNumber = doc['streetNumber'];
    // place?.street = doc['street'];
    // place?.city = doc['city'];
    // place?.state = doc['state'];
    // place?.zipCode = doc['zipCode'];
  }
}
