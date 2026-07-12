import 'package:cloud_firestore/cloud_firestore.dart';

import 'rating.dart';

Rating ratingFromFirestore(String id, Map<String, dynamic> data) {
  return Rating(
    id: id,
    startupId: data['startupId'] as String? ?? '',
    studentId: data['studentId'] as String? ?? '',
    studentName: data['studentName'] as String? ?? '',
    score: data['score'] as int? ?? 0,
    comment: data['comment'] as String?,
    createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
  );
}

Map<String, dynamic> ratingToMap(Rating rating) {
  return {
    'startupId': rating.startupId,
    'studentId': rating.studentId,
    'studentName': rating.studentName,
    'score': rating.score,
    'comment': rating.comment,
    'createdAt': FieldValue.serverTimestamp(),
  };
}
