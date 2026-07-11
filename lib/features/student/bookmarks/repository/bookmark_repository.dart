import 'package:cloud_firestore/cloud_firestore.dart';

class BookmarkRepository {
  BookmarkRepository(this._firestore);

  final FirebaseFirestore _firestore;

  String _docId(String studentId, String opportunityId) => '${studentId}_$opportunityId';

  Stream<Set<String>> watchBookmarkedIds(String studentId) {
    return _firestore
        .collection('bookmarks')
        .where('studentId', isEqualTo: studentId)
        .snapshots()
        .map((snapshot) => {
          for (final doc in snapshot.docs) doc.data()['opportunityId'] as String,
        });
  }

  Future<void> setBookmarked(String studentId, String opportunityId, bool bookmarked) {
    final doc = _firestore.collection('bookmarks').doc(_docId(studentId, opportunityId));

    if (bookmarked) {
      return doc.set({
        'studentId': studentId,
        'opportunityId': opportunityId,
        'createdAt': FieldValue.serverTimestamp(),
      });
    }

    return doc.delete();
  }
}
