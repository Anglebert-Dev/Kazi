// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$bookmarkRepositoryHash() =>
    r'55fe5775e0aa8797c7041c14488ae208ab4c1d68';

/// See also [bookmarkRepository].
@ProviderFor(bookmarkRepository)
final bookmarkRepositoryProvider =
    AutoDisposeProvider<BookmarkRepository>.internal(
      bookmarkRepository,
      name: r'bookmarkRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$bookmarkRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef BookmarkRepositoryRef = AutoDisposeProviderRef<BookmarkRepository>;
String _$bookmarkedOpportunityIdsHash() =>
    r'cca58f16a130941b0a3eaa240d5c919393ff92a0';

/// See also [bookmarkedOpportunityIds].
@ProviderFor(bookmarkedOpportunityIds)
final bookmarkedOpportunityIdsProvider =
    AutoDisposeStreamProvider<Set<String>>.internal(
      bookmarkedOpportunityIds,
      name: r'bookmarkedOpportunityIdsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$bookmarkedOpportunityIdsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef BookmarkedOpportunityIdsRef = AutoDisposeStreamProviderRef<Set<String>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
