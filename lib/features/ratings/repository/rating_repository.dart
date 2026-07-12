import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/rating.dart';
import '../models/rating_mapper.dart';

class RatingRepository {
  RatingRepository(this._firestore);

  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> get _collection => _firestore.collection('ratings');

  String _docId(String studentId, String startupId) => '${studentId}_$startupId';

  Stream<List<Rating>> watchForStartup(String startupId) {
    return _collection.where('startupId', isEqualTo: startupId).snapshots().map(
      (snapshot) => [
        for (final doc in snapshot.docs) ratingFromFirestore(doc.id, doc.data()),
      ],
    );
  }

  Stream<Rating?> watchByStudentAndStartup(String studentId, String startupId) {
    return _collection.doc(_docId(studentId, startupId)).snapshots().map((doc) {
      final data = doc.data();
      if (data == null) return null;
      return ratingFromFirestore(doc.id, data);
    });
  }

  Future<void> create(Rating rating) {
    final docId = _docId(rating.studentId, rating.startupId);
    return _collection.doc(docId).set(ratingToMap(rating));
  }
}
