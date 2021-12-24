import 'package:cloud_firestore/cloud_firestore.dart';

class FavoriteCharity {
  String? title;
  String? ein;
  String? category;
  DateTime? date;

  FavoriteCharity({
    this.ein,
    this.category,
    this.title,
    this.date,
  });

  FavoriteCharity.fromDocumentSnapshot(
    DocumentSnapshot doc,
  ) {
    title = doc['title'];
    ein = doc['ein'];
    category = doc['category'];
    date = doc['date'].toDate();
  }
}
