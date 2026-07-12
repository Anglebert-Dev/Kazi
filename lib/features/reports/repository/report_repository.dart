import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/report.dart';
import '../models/report_mapper.dart';
import '../models/report_status.dart';

class ReportRepository {
  ReportRepository(this._firestore);

  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> get _collection => _firestore.collection('reports');

  Stream<List<Report>> watchPending() {
    return _collection
        .where('status', isEqualTo: ReportStatus.pending.name)
        .snapshots()
        .map(
          (snapshot) => [
            for (final doc in snapshot.docs) reportFromFirestore(doc.id, doc.data()),
          ]..sort((a, b) => b.createdAt.compareTo(a.createdAt)),
        );
  }

  Future<void> create(Report report) {
    return _collection.add(reportToMap(report));
  }

  Future<void> updateStatus(String reportId, ReportStatus status) {
    return _collection.doc(reportId).update({'status': status.name});
  }
}
