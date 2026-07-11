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
String _$startupByIdHash() => r'aecd3820da234b3954a399a353e820a56290aee9';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [startupById].
@ProviderFor(startupById)
const startupByIdProvider = StartupByIdFamily();

/// See also [startupById].
class StartupByIdFamily extends Family<AsyncValue<Startup>> {
  /// See also [startupById].
  const StartupByIdFamily();

  /// See also [startupById].
  StartupByIdProvider call(String startupId) {
    return StartupByIdProvider(startupId);
  }

  @override
  StartupByIdProvider getProviderOverride(
    covariant StartupByIdProvider provider,
  ) {
    return call(provider.startupId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'startupByIdProvider';
}

/// See also [startupById].
class StartupByIdProvider extends AutoDisposeStreamProvider<Startup> {
  /// See also [startupById].
  StartupByIdProvider(String startupId)
    : this._internal(
        (ref) => startupById(ref as StartupByIdRef, startupId),
        from: startupByIdProvider,
        name: r'startupByIdProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$startupByIdHash,
        dependencies: StartupByIdFamily._dependencies,
        allTransitiveDependencies: StartupByIdFamily._allTransitiveDependencies,
        startupId: startupId,
      );

  StartupByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.startupId,
  }) : super.internal();

  final String startupId;

  @override
  Override overrideWith(
    Stream<Startup> Function(StartupByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: StartupByIdProvider._internal(
        (ref) => create(ref as StartupByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        startupId: startupId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<Startup> createElement() {
    return _StartupByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StartupByIdProvider && other.startupId == startupId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, startupId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin StartupByIdRef on AutoDisposeStreamProviderRef<Startup> {
  /// The parameter `startupId` of this provider.
  String get startupId;
}

class _StartupByIdProviderElement
    extends AutoDisposeStreamProviderElement<Startup>
    with StartupByIdRef {
  _StartupByIdProviderElement(super.provider);

  @override
  String get startupId => (origin as StartupByIdProvider).startupId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
