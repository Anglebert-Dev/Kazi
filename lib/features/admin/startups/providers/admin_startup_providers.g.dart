// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_startup_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$adminStartupRepositoryHash() =>
    r'b203faf2fac5aef1bffaca28c1f175bc7eb2de5f';

/// See also [adminStartupRepository].
@ProviderFor(adminStartupRepository)
final adminStartupRepositoryProvider =
    AutoDisposeProvider<AdminStartupRepository>.internal(
      adminStartupRepository,
      name: r'adminStartupRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$adminStartupRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AdminStartupRepositoryRef =
    AutoDisposeProviderRef<AdminStartupRepository>;
String _$pendingStartupsHash() => r'f5e08b77027ccfc6c076f84f76dfe884aa86ce2d';

/// See also [pendingStartups].
@ProviderFor(pendingStartups)
final pendingStartupsProvider =
    AutoDisposeStreamProvider<List<Startup>>.internal(
      pendingStartups,
      name: r'pendingStartupsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$pendingStartupsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PendingStartupsRef = AutoDisposeStreamProviderRef<List<Startup>>;
String _$allStartupsHash() => r'12eff0ee21cac2327bc92657038f6834ea53e6f1';

/// See also [allStartups].
@ProviderFor(allStartups)
final allStartupsProvider = AutoDisposeStreamProvider<List<Startup>>.internal(
  allStartups,
  name: r'allStartupsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$allStartupsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AllStartupsRef = AutoDisposeStreamProviderRef<List<Startup>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
