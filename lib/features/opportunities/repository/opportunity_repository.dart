import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/opportunity.dart';
import '../models/opportunity_mapper.dart';

class OpportunityRepository {
  OpportunityRepository(this._firestore);

  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> get _collection =>
      _firestore.collection('opportunities');

  Stream<List<Opportunity>> watchAll() {
    return _collection.orderBy('createdAt', descending: true).snapshots().map(
      (snapshot) => [
        for (final doc in snapshot.docs) opportunityFromFirestore(doc.id, doc.data()),
      ],
    );
  }

  Stream<List<Opportunity>> watchByStartup(String startupId) {
    return _collection.where('startupId', isEqualTo: startupId).snapshots().map((snapshot) {
      final opportunities = [
        for (final doc in snapshot.docs) opportunityFromFirestore(doc.id, doc.data()),
      ];
      opportunities.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      return opportunities;
    });
  }

  Future<void> create(Opportunity opportunity) {
    return _collection.add(opportunityToMap(opportunity));
  }

  Future<void> update(Opportunity opportunity) {
    return _collection.doc(opportunity.id).update(opportunityToMap(opportunity));
  }

  Future<void> delete(String id) {
    return _collection.doc(id).delete();
  }
}
