import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/dashboard_stats.dart';
import '../repository/dashboard_repository.dart';

part 'dashboard_providers.g.dart';

@riverpod
DashboardRepository dashboardRepository(Ref ref) {
  return DashboardRepository(FirebaseFirestore.instance);
}

@riverpod
Future<DashboardStats> dashboardStats(Ref ref) {
  return ref.watch(dashboardRepositoryProvider).fetchStats();
}
