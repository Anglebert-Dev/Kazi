import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/application.dart';
import '../models/application_mapper.dart';
import '../models/application_status.dart';

class ApplicationRepository {
  ApplicationRepository(this._firestore);

  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> get _collection =>
      _firestore.collection('applications');

  String _docId(String studentId, String opportunityId) => '${studentId}_$opportunityId';

  Stream<Application?> watchById(String studentId, String opportunityId) {
    return _collection.doc(_docId(studentId, opportunityId)).snapshots().map((doc) {
      final data = doc.data();
      if (data == null) return null;
      return applicationFromFirestore(doc.id, data);
    });
  }

  Stream<List<Application>> watchByStudent(String studentId) {
    return _collection.where('studentId', isEqualTo: studentId).snapshots().map((snapshot) {
      final applications = [
        for (final doc in snapshot.docs) applicationFromFirestore(doc.id, doc.data()),
      ];
      applications.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      return applications;
    });
  }

  Stream<List<Application>> watchByStartup(String startupId) {
    return _collection.where('startupId', isEqualTo: startupId).snapshots().map((snapshot) {
      final applications = [
        for (final doc in snapshot.docs) applicationFromFirestore(doc.id, doc.data()),
      ];
      applications.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      return applications;
    });
  }

  Future<void> create(Application application) {
    final docId = _docId(application.studentId, application.opportunityId);
    return _collection.doc(docId).set(applicationToMap(application));
  }

  Future<void> updateStatus(String applicationId, ApplicationStatus status) {
    return _collection.doc(applicationId).update({'status': status.name});
  }
}
