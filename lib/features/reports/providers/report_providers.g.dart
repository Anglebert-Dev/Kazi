// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$reportRepositoryHash() => r'f75d5b0e192af0f9159d06fcdf2075efbb5eb1eb';

/// See also [reportRepository].
@ProviderFor(reportRepository)
final reportRepositoryProvider = AutoDisposeProvider<ReportRepository>.internal(
  reportRepository,
  name: r'reportRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$reportRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ReportRepositoryRef = AutoDisposeProviderRef<ReportRepository>;
String _$pendingReportsHash() => r'735e92b298a61c7e7623d5947a4897a185b349bc';

/// See also [pendingReports].
@ProviderFor(pendingReports)
final pendingReportsProvider = AutoDisposeStreamProvider<List<Report>>.internal(
  pendingReports,
  name: r'pendingReportsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pendingReportsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PendingReportsRef = AutoDisposeStreamProviderRef<List<Report>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
