import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_stats.freezed.dart';

@freezed
class DashboardStats with _$DashboardStats {
  const factory DashboardStats({
    @Default(0) int studentCount,
    @Default(0) int founderCount,
    @Default(0) int totalStartupCount,
    @Default(0) int pendingVerificationCount,
    @Default(0) int approvedStartupCount,
    @Default(0) int rejectedStartupCount,
  }) = _DashboardStats;
}
