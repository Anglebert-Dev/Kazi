// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$ratingRepositoryHash() => r'17403430971e80651065aaf62abe7caa8c77aa12';

/// See also [ratingRepository].
@ProviderFor(ratingRepository)
final ratingRepositoryProvider = AutoDisposeProvider<RatingRepository>.internal(
  ratingRepository,
  name: r'ratingRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$ratingRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RatingRepositoryRef = AutoDisposeProviderRef<RatingRepository>;
String _$ratingsForStartupHash() => r'f0aa78526fa404d2ee404a6e1633752be7361182';

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

/// See also [ratingsForStartup].
@ProviderFor(ratingsForStartup)
const ratingsForStartupProvider = RatingsForStartupFamily();

/// See also [ratingsForStartup].
class RatingsForStartupFamily extends Family<AsyncValue<List<Rating>>> {
  /// See also [ratingsForStartup].
  const RatingsForStartupFamily();

  /// See also [ratingsForStartup].
  RatingsForStartupProvider call(String startupId) {
    return RatingsForStartupProvider(startupId);
  }

  @override
  RatingsForStartupProvider getProviderOverride(
    covariant RatingsForStartupProvider provider,
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
  String? get name => r'ratingsForStartupProvider';
}

/// See also [ratingsForStartup].
class RatingsForStartupProvider
    extends AutoDisposeStreamProvider<List<Rating>> {
  /// See also [ratingsForStartup].
  RatingsForStartupProvider(String startupId)
    : this._internal(
        (ref) => ratingsForStartup(ref as RatingsForStartupRef, startupId),
        from: ratingsForStartupProvider,
        name: r'ratingsForStartupProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$ratingsForStartupHash,
        dependencies: RatingsForStartupFamily._dependencies,
        allTransitiveDependencies:
            RatingsForStartupFamily._allTransitiveDependencies,
        startupId: startupId,
      );

  RatingsForStartupProvider._internal(
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
    Stream<List<Rating>> Function(RatingsForStartupRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RatingsForStartupProvider._internal(
        (ref) => create(ref as RatingsForStartupRef),
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
  AutoDisposeStreamProviderElement<List<Rating>> createElement() {
    return _RatingsForStartupProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RatingsForStartupProvider && other.startupId == startupId;
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
mixin RatingsForStartupRef on AutoDisposeStreamProviderRef<List<Rating>> {
  /// The parameter `startupId` of this provider.
  String get startupId;
}

class _RatingsForStartupProviderElement
    extends AutoDisposeStreamProviderElement<List<Rating>>
    with RatingsForStartupRef {
  _RatingsForStartupProviderElement(super.provider);

  @override
  String get startupId => (origin as RatingsForStartupProvider).startupId;
}

String _$ratingByStudentAndStartupHash() =>
    r'f965bb307c652bebefe8785c76119537965a93ca';

/// See also [ratingByStudentAndStartup].
@ProviderFor(ratingByStudentAndStartup)
const ratingByStudentAndStartupProvider = RatingByStudentAndStartupFamily();

/// See also [ratingByStudentAndStartup].
class RatingByStudentAndStartupFamily extends Family<AsyncValue<Rating?>> {
  /// See also [ratingByStudentAndStartup].
  const RatingByStudentAndStartupFamily();

  /// See also [ratingByStudentAndStartup].
  RatingByStudentAndStartupProvider call(String studentId, String startupId) {
    return RatingByStudentAndStartupProvider(studentId, startupId);
  }

  @override
  RatingByStudentAndStartupProvider getProviderOverride(
    covariant RatingByStudentAndStartupProvider provider,
  ) {
    return call(provider.studentId, provider.startupId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'ratingByStudentAndStartupProvider';
}

/// See also [ratingByStudentAndStartup].
class RatingByStudentAndStartupProvider
    extends AutoDisposeStreamProvider<Rating?> {
  /// See also [ratingByStudentAndStartup].
  RatingByStudentAndStartupProvider(String studentId, String startupId)
    : this._internal(
        (ref) => ratingByStudentAndStartup(
          ref as RatingByStudentAndStartupRef,
          studentId,
          startupId,
        ),
        from: ratingByStudentAndStartupProvider,
        name: r'ratingByStudentAndStartupProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$ratingByStudentAndStartupHash,
        dependencies: RatingByStudentAndStartupFamily._dependencies,
        allTransitiveDependencies:
            RatingByStudentAndStartupFamily._allTransitiveDependencies,
        studentId: studentId,
        startupId: startupId,
      );

  RatingByStudentAndStartupProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.studentId,
    required this.startupId,
  }) : super.internal();

  final String studentId;
  final String startupId;

  @override
  Override overrideWith(
    Stream<Rating?> Function(RatingByStudentAndStartupRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RatingByStudentAndStartupProvider._internal(
        (ref) => create(ref as RatingByStudentAndStartupRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        studentId: studentId,
        startupId: startupId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<Rating?> createElement() {
    return _RatingByStudentAndStartupProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RatingByStudentAndStartupProvider &&
        other.studentId == studentId &&
        other.startupId == startupId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, studentId.hashCode);
    hash = _SystemHash.combine(hash, startupId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RatingByStudentAndStartupRef on AutoDisposeStreamProviderRef<Rating?> {
  /// The parameter `studentId` of this provider.
  String get studentId;

  /// The parameter `startupId` of this provider.
  String get startupId;
}

class _RatingByStudentAndStartupProviderElement
    extends AutoDisposeStreamProviderElement<Rating?>
    with RatingByStudentAndStartupRef {
  _RatingByStudentAndStartupProviderElement(super.provider);

  @override
  String get studentId =>
      (origin as RatingByStudentAndStartupProvider).studentId;
  @override
  String get startupId =>
      (origin as RatingByStudentAndStartupProvider).startupId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
