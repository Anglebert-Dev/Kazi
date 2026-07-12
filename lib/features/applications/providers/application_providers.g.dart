// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$applicationRepositoryHash() =>
    r'37faccce685ebc811f04a2bfc2f74cf65619b9a4';

/// See also [applicationRepository].
@ProviderFor(applicationRepository)
final applicationRepositoryProvider =
    AutoDisposeProvider<ApplicationRepository>.internal(
      applicationRepository,
      name: r'applicationRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$applicationRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ApplicationRepositoryRef =
    AutoDisposeProviderRef<ApplicationRepository>;
String _$applicationForOpportunityHash() =>
    r'4ce85db49a4b422eb25af4cd548e773f0d1e6e21';

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

/// See also [applicationForOpportunity].
@ProviderFor(applicationForOpportunity)
const applicationForOpportunityProvider = ApplicationForOpportunityFamily();

/// See also [applicationForOpportunity].
class ApplicationForOpportunityFamily extends Family<AsyncValue<Application?>> {
  /// See also [applicationForOpportunity].
  const ApplicationForOpportunityFamily();

  /// See also [applicationForOpportunity].
  ApplicationForOpportunityProvider call(
    String studentId,
    String opportunityId,
  ) {
    return ApplicationForOpportunityProvider(studentId, opportunityId);
  }

  @override
  ApplicationForOpportunityProvider getProviderOverride(
    covariant ApplicationForOpportunityProvider provider,
  ) {
    return call(provider.studentId, provider.opportunityId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'applicationForOpportunityProvider';
}

/// See also [applicationForOpportunity].
class ApplicationForOpportunityProvider
    extends AutoDisposeStreamProvider<Application?> {
  /// See also [applicationForOpportunity].
  ApplicationForOpportunityProvider(String studentId, String opportunityId)
    : this._internal(
        (ref) => applicationForOpportunity(
          ref as ApplicationForOpportunityRef,
          studentId,
          opportunityId,
        ),
        from: applicationForOpportunityProvider,
        name: r'applicationForOpportunityProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$applicationForOpportunityHash,
        dependencies: ApplicationForOpportunityFamily._dependencies,
        allTransitiveDependencies:
            ApplicationForOpportunityFamily._allTransitiveDependencies,
        studentId: studentId,
        opportunityId: opportunityId,
      );

  ApplicationForOpportunityProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.studentId,
    required this.opportunityId,
  }) : super.internal();

  final String studentId;
  final String opportunityId;

  @override
  Override overrideWith(
    Stream<Application?> Function(ApplicationForOpportunityRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ApplicationForOpportunityProvider._internal(
        (ref) => create(ref as ApplicationForOpportunityRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        studentId: studentId,
        opportunityId: opportunityId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<Application?> createElement() {
    return _ApplicationForOpportunityProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ApplicationForOpportunityProvider &&
        other.studentId == studentId &&
        other.opportunityId == opportunityId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, studentId.hashCode);
    hash = _SystemHash.combine(hash, opportunityId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ApplicationForOpportunityRef
    on AutoDisposeStreamProviderRef<Application?> {
  /// The parameter `studentId` of this provider.
  String get studentId;

  /// The parameter `opportunityId` of this provider.
  String get opportunityId;
}

class _ApplicationForOpportunityProviderElement
    extends AutoDisposeStreamProviderElement<Application?>
    with ApplicationForOpportunityRef {
  _ApplicationForOpportunityProviderElement(super.provider);

  @override
  String get studentId =>
      (origin as ApplicationForOpportunityProvider).studentId;
  @override
  String get opportunityId =>
      (origin as ApplicationForOpportunityProvider).opportunityId;
}

String _$applicationByIdHash() => r'56ef7eb458a1ac978cd8eccc974dea54a5fd3f19';

/// See also [applicationById].
@ProviderFor(applicationById)
const applicationByIdProvider = ApplicationByIdFamily();

/// See also [applicationById].
class ApplicationByIdFamily extends Family<AsyncValue<Application?>> {
  /// See also [applicationById].
  const ApplicationByIdFamily();

  /// See also [applicationById].
  ApplicationByIdProvider call(String applicationId) {
    return ApplicationByIdProvider(applicationId);
  }

  @override
  ApplicationByIdProvider getProviderOverride(
    covariant ApplicationByIdProvider provider,
  ) {
    return call(provider.applicationId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'applicationByIdProvider';
}

/// See also [applicationById].
class ApplicationByIdProvider extends AutoDisposeStreamProvider<Application?> {
  /// See also [applicationById].
  ApplicationByIdProvider(String applicationId)
    : this._internal(
        (ref) => applicationById(ref as ApplicationByIdRef, applicationId),
        from: applicationByIdProvider,
        name: r'applicationByIdProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$applicationByIdHash,
        dependencies: ApplicationByIdFamily._dependencies,
        allTransitiveDependencies:
            ApplicationByIdFamily._allTransitiveDependencies,
        applicationId: applicationId,
      );

  ApplicationByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.applicationId,
  }) : super.internal();

  final String applicationId;

  @override
  Override overrideWith(
    Stream<Application?> Function(ApplicationByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ApplicationByIdProvider._internal(
        (ref) => create(ref as ApplicationByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        applicationId: applicationId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<Application?> createElement() {
    return _ApplicationByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ApplicationByIdProvider &&
        other.applicationId == applicationId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, applicationId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ApplicationByIdRef on AutoDisposeStreamProviderRef<Application?> {
  /// The parameter `applicationId` of this provider.
  String get applicationId;
}

class _ApplicationByIdProviderElement
    extends AutoDisposeStreamProviderElement<Application?>
    with ApplicationByIdRef {
  _ApplicationByIdProviderElement(super.provider);

  @override
  String get applicationId => (origin as ApplicationByIdProvider).applicationId;
}

String _$studentApplicationsHash() =>
    r'74594059588b827435fc8c7e1265631970f1f8b1';

/// See also [studentApplications].
@ProviderFor(studentApplications)
const studentApplicationsProvider = StudentApplicationsFamily();

/// See also [studentApplications].
class StudentApplicationsFamily extends Family<AsyncValue<List<Application>>> {
  /// See also [studentApplications].
  const StudentApplicationsFamily();

  /// See also [studentApplications].
  StudentApplicationsProvider call(String studentId) {
    return StudentApplicationsProvider(studentId);
  }

  @override
  StudentApplicationsProvider getProviderOverride(
    covariant StudentApplicationsProvider provider,
  ) {
    return call(provider.studentId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'studentApplicationsProvider';
}

/// See also [studentApplications].
class StudentApplicationsProvider
    extends AutoDisposeStreamProvider<List<Application>> {
  /// See also [studentApplications].
  StudentApplicationsProvider(String studentId)
    : this._internal(
        (ref) => studentApplications(ref as StudentApplicationsRef, studentId),
        from: studentApplicationsProvider,
        name: r'studentApplicationsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$studentApplicationsHash,
        dependencies: StudentApplicationsFamily._dependencies,
        allTransitiveDependencies:
            StudentApplicationsFamily._allTransitiveDependencies,
        studentId: studentId,
      );

  StudentApplicationsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.studentId,
  }) : super.internal();

  final String studentId;

  @override
  Override overrideWith(
    Stream<List<Application>> Function(StudentApplicationsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: StudentApplicationsProvider._internal(
        (ref) => create(ref as StudentApplicationsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        studentId: studentId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<Application>> createElement() {
    return _StudentApplicationsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StudentApplicationsProvider && other.studentId == studentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, studentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin StudentApplicationsRef
    on AutoDisposeStreamProviderRef<List<Application>> {
  /// The parameter `studentId` of this provider.
  String get studentId;
}

class _StudentApplicationsProviderElement
    extends AutoDisposeStreamProviderElement<List<Application>>
    with StudentApplicationsRef {
  _StudentApplicationsProviderElement(super.provider);

  @override
  String get studentId => (origin as StudentApplicationsProvider).studentId;
}

String _$startupApplicationsHash() =>
    r'79609bd99c4c7ebd661631fba84e40877dbfdf00';

/// See also [startupApplications].
@ProviderFor(startupApplications)
const startupApplicationsProvider = StartupApplicationsFamily();

/// See also [startupApplications].
class StartupApplicationsFamily extends Family<AsyncValue<List<Application>>> {
  /// See also [startupApplications].
  const StartupApplicationsFamily();

  /// See also [startupApplications].
  StartupApplicationsProvider call(String startupId) {
    return StartupApplicationsProvider(startupId);
  }

  @override
  StartupApplicationsProvider getProviderOverride(
    covariant StartupApplicationsProvider provider,
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
  String? get name => r'startupApplicationsProvider';
}

/// See also [startupApplications].
class StartupApplicationsProvider
    extends AutoDisposeStreamProvider<List<Application>> {
  /// See also [startupApplications].
  StartupApplicationsProvider(String startupId)
    : this._internal(
        (ref) => startupApplications(ref as StartupApplicationsRef, startupId),
        from: startupApplicationsProvider,
        name: r'startupApplicationsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$startupApplicationsHash,
        dependencies: StartupApplicationsFamily._dependencies,
        allTransitiveDependencies:
            StartupApplicationsFamily._allTransitiveDependencies,
        startupId: startupId,
      );

  StartupApplicationsProvider._internal(
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
    Stream<List<Application>> Function(StartupApplicationsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: StartupApplicationsProvider._internal(
        (ref) => create(ref as StartupApplicationsRef),
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
  AutoDisposeStreamProviderElement<List<Application>> createElement() {
    return _StartupApplicationsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StartupApplicationsProvider && other.startupId == startupId;
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
mixin StartupApplicationsRef
    on AutoDisposeStreamProviderRef<List<Application>> {
  /// The parameter `startupId` of this provider.
  String get startupId;
}

class _StartupApplicationsProviderElement
    extends AutoDisposeStreamProviderElement<List<Application>>
    with StartupApplicationsRef {
  _StartupApplicationsProviderElement(super.provider);

  @override
  String get startupId => (origin as StartupApplicationsProvider).startupId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
