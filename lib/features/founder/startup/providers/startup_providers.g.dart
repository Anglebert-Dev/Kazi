// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'startup_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$startupRepositoryHash() => r'7c7a494b1b3fb16e837e53ab26e3b6f1c816c1e7';

/// See also [startupRepository].
@ProviderFor(startupRepository)
final startupRepositoryProvider =
    AutoDisposeProvider<StartupRepository>.internal(
      startupRepository,
      name: r'startupRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$startupRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef StartupRepositoryRef = AutoDisposeProviderRef<StartupRepository>;
String _$currentStartupHash() => r'9624933ab9dff60e13401667c84e4ea9d59b1a5b';

/// See also [currentStartup].
@ProviderFor(currentStartup)
final currentStartupProvider = AutoDisposeStreamProvider<Startup>.internal(
  currentStartup,
  name: r'currentStartupProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentStartupHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentStartupRef = AutoDisposeStreamProviderRef<Startup>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
