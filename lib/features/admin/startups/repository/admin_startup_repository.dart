import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../founder/startup/models/startup.dart';
import '../../../founder/startup/models/startup_mapper.dart';
import '../../../founder/startup/models/verification_status.dart';

class AdminStartupRepository {
  AdminStartupRepository(this._firestore);

  final FirebaseFirestore _firestore;

  Stream<List<Startup>> watchPendingStartups() {
    return _firestore
        .collection('startups')
        .where('verificationStatus', isEqualTo: VerificationStatus.pending.name)
        .snapshots()
        .map(
          (snapshot) => [
            for (final doc in snapshot.docs) startupFromFirestore(doc.id, doc.data()),
          ],
        );
  }

  Future<void> approve(String founderId) {
    return _firestore.collection('startups').doc(founderId).update({
      'verificationStatus': VerificationStatus.approved.name,
      'verificationRejectionReason': null,
    });
  }

  Future<void> reject(String founderId, String reason) {
    return _firestore.collection('startups').doc(founderId).update({
      'verificationStatus': VerificationStatus.rejected.name,
      'verificationRejectionReason': reason,
    });
  }

  Future<void> suspend(String founderId, String reason) {
    return _firestore.collection('startups').doc(founderId).update({
      'isSuspended': true,
      'suspensionReason': reason,
    });
  }

  Future<void> unsuspend(String founderId) {
    return _firestore.collection('startups').doc(founderId).update({
      'isSuspended': false,
      'suspensionReason': null,
    });
  }
}
