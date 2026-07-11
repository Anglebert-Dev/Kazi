import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../authentication/models/user_role.dart';
import '../../../founder/startup/models/verification_status.dart';
import '../models/dashboard_stats.dart';

class DashboardRepository {
  DashboardRepository(this._firestore);

  final FirebaseFirestore _firestore;

  Future<DashboardStats> fetchStats() async {
    final counts = await Future.wait([
      _countUsersByRole(UserRole.student),
      _countUsersByRole(UserRole.founder),
      _countCollection('startups'),
      _countStartupsByStatus(VerificationStatus.pending),
      _countStartupsByStatus(VerificationStatus.approved),
      _countStartupsByStatus(VerificationStatus.rejected),
    ]);

    return DashboardStats(
      studentCount: counts[0],
      founderCount: counts[1],
      totalStartupCount: counts[2],
      pendingVerificationCount: counts[3],
      approvedStartupCount: counts[4],
      rejectedStartupCount: counts[5],
    );
  }

  Future<int> _countUsersByRole(UserRole role) async {
    final snapshot = await _firestore
        .collection('users')
        .where('role', isEqualTo: role.name)
        .count()
        .get();
    return snapshot.count ?? 0;
  }

  Future<int> _countStartupsByStatus(VerificationStatus status) async {
    final snapshot = await _firestore
        .collection('startups')
        .where('verificationStatus', isEqualTo: status.name)
        .count()
        .get();
    return snapshot.count ?? 0;
  }

  Future<int> _countCollection(String collection) async {
    final snapshot = await _firestore.collection(collection).count().get();
    return snapshot.count ?? 0;
  }
}
