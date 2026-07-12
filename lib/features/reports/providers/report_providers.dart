import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/report.dart';
import '../repository/report_repository.dart';

part 'report_providers.g.dart';

@riverpod
ReportRepository reportRepository(Ref ref) {
  return ReportRepository(FirebaseFirestore.instance);
}

@riverpod
Stream<List<Report>> pendingReports(Ref ref) {
  return ref.watch(reportRepositoryProvider).watchPending();
}
