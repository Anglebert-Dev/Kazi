// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoryRepositoryHash() =>
    r'bc52309e8fe194f02caa6feaa4c57fced4b78679';

/// See also [categoryRepository].
@ProviderFor(categoryRepository)
final categoryRepositoryProvider =
    AutoDisposeProvider<CategoryRepository>.internal(
      categoryRepository,
      name: r'categoryRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$categoryRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CategoryRepositoryRef = AutoDisposeProviderRef<CategoryRepository>;
String _$categoriesByTypeHash() => r'1520e1381b2d1aaea06bb261623bf688a38ddf39';

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

/// See also [categoriesByType].
@ProviderFor(categoriesByType)
const categoriesByTypeProvider = CategoriesByTypeFamily();

/// See also [categoriesByType].
class CategoriesByTypeFamily extends Family<AsyncValue<List<Category>>> {
  /// See also [categoriesByType].
  const CategoriesByTypeFamily();

  /// See also [categoriesByType].
  CategoriesByTypeProvider call(CategoryType type, {bool activeOnly = true}) {
    return CategoriesByTypeProvider(type, activeOnly: activeOnly);
  }

  @override
  CategoriesByTypeProvider getProviderOverride(
    covariant CategoriesByTypeProvider provider,
  ) {
    return call(provider.type, activeOnly: provider.activeOnly);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'categoriesByTypeProvider';
}

/// See also [categoriesByType].
class CategoriesByTypeProvider
    extends AutoDisposeStreamProvider<List<Category>> {
  /// See also [categoriesByType].
  CategoriesByTypeProvider(CategoryType type, {bool activeOnly = true})
    : this._internal(
        (ref) => categoriesByType(
          ref as CategoriesByTypeRef,
          type,
          activeOnly: activeOnly,
        ),
        from: categoriesByTypeProvider,
        name: r'categoriesByTypeProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$categoriesByTypeHash,
        dependencies: CategoriesByTypeFamily._dependencies,
        allTransitiveDependencies:
            CategoriesByTypeFamily._allTransitiveDependencies,
        type: type,
        activeOnly: activeOnly,
      );

  CategoriesByTypeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.type,
    required this.activeOnly,
  }) : super.internal();

  final CategoryType type;
  final bool activeOnly;

  @override
  Override overrideWith(
    Stream<List<Category>> Function(CategoriesByTypeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CategoriesByTypeProvider._internal(
        (ref) => create(ref as CategoriesByTypeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        type: type,
        activeOnly: activeOnly,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<Category>> createElement() {
    return _CategoriesByTypeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CategoriesByTypeProvider &&
        other.type == type &&
        other.activeOnly == activeOnly;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);
    hash = _SystemHash.combine(hash, activeOnly.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CategoriesByTypeRef on AutoDisposeStreamProviderRef<List<Category>> {
  /// The parameter `type` of this provider.
  CategoryType get type;

  /// The parameter `activeOnly` of this provider.
  bool get activeOnly;
}

class _CategoriesByTypeProviderElement
    extends AutoDisposeStreamProviderElement<List<Category>>
    with CategoriesByTypeRef {
  _CategoriesByTypeProviderElement(super.provider);

  @override
  CategoryType get type => (origin as CategoriesByTypeProvider).type;
  @override
  bool get activeOnly => (origin as CategoriesByTypeProvider).activeOnly;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
