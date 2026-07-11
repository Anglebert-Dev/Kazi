import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/opportunity.dart';
import '../repository/opportunity_repository.dart';

part 'opportunity_providers.g.dart';

@riverpod
OpportunityRepository opportunityRepository(Ref ref) {
  return OpportunityRepository(FirebaseFirestore.instance);
}

@riverpod
Stream<List<Opportunity>> allOpportunities(Ref ref) {
  return ref.watch(opportunityRepositoryProvider).watchAll();
}

@riverpod
Stream<List<Opportunity>> founderOpportunities(Ref ref, String startupId) {
  return ref.watch(opportunityRepositoryProvider).watchByStartup(startupId);
}
