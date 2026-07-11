// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opportunity_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$opportunityRepositoryHash() =>
    r'a967838905e73e050c671ca7ad5c0a79881dea03';

/// See also [opportunityRepository].
@ProviderFor(opportunityRepository)
final opportunityRepositoryProvider =
    AutoDisposeProvider<OpportunityRepository>.internal(
      opportunityRepository,
      name: r'opportunityRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$opportunityRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef OpportunityRepositoryRef =
    AutoDisposeProviderRef<OpportunityRepository>;
String _$allOpportunitiesHash() => r'167b423aa397a049d85b928394b6696146f1de14';

/// See also [allOpportunities].
@ProviderFor(allOpportunities)
final allOpportunitiesProvider =
    AutoDisposeStreamProvider<List<Opportunity>>.internal(
      allOpportunities,
      name: r'allOpportunitiesProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$allOpportunitiesHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AllOpportunitiesRef = AutoDisposeStreamProviderRef<List<Opportunity>>;
String _$founderOpportunitiesHash() =>
    r'e363825ff97bf3989ec04467d9ea37f14942c71e';

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

/// See also [founderOpportunities].
@ProviderFor(founderOpportunities)
const founderOpportunitiesProvider = FounderOpportunitiesFamily();

/// See also [founderOpportunities].
class FounderOpportunitiesFamily extends Family<AsyncValue<List<Opportunity>>> {
  /// See also [founderOpportunities].
  const FounderOpportunitiesFamily();

  /// See also [founderOpportunities].
  FounderOpportunitiesProvider call(String startupId) {
    return FounderOpportunitiesProvider(startupId);
  }

  @override
  FounderOpportunitiesProvider getProviderOverride(
    covariant FounderOpportunitiesProvider provider,
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
  String? get name => r'founderOpportunitiesProvider';
}

/// See also [founderOpportunities].
class FounderOpportunitiesProvider
    extends AutoDisposeStreamProvider<List<Opportunity>> {
  /// See also [founderOpportunities].
  FounderOpportunitiesProvider(String startupId)
    : this._internal(
        (ref) =>
            founderOpportunities(ref as FounderOpportunitiesRef, startupId),
        from: founderOpportunitiesProvider,
        name: r'founderOpportunitiesProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$founderOpportunitiesHash,
        dependencies: FounderOpportunitiesFamily._dependencies,
        allTransitiveDependencies:
            FounderOpportunitiesFamily._allTransitiveDependencies,
        startupId: startupId,
      );

  FounderOpportunitiesProvider._internal(
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
    Stream<List<Opportunity>> Function(FounderOpportunitiesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FounderOpportunitiesProvider._internal(
        (ref) => create(ref as FounderOpportunitiesRef),
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
  AutoDisposeStreamProviderElement<List<Opportunity>> createElement() {
    return _FounderOpportunitiesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FounderOpportunitiesProvider &&
        other.startupId == startupId;
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
mixin FounderOpportunitiesRef
    on AutoDisposeStreamProviderRef<List<Opportunity>> {
  /// The parameter `startupId` of this provider.
  String get startupId;
}

class _FounderOpportunitiesProviderElement
    extends AutoDisposeStreamProviderElement<List<Opportunity>>
    with FounderOpportunitiesRef {
  _FounderOpportunitiesProviderElement(super.provider);

  @override
  String get startupId => (origin as FounderOpportunitiesProvider).startupId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
