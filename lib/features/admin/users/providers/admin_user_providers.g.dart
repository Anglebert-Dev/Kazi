// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_user_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$adminUserRepositoryHash() =>
    r'79ff1c70009d86b6bf796599a7764a6ccf873b5f';

/// See also [adminUserRepository].
@ProviderFor(adminUserRepository)
final adminUserRepositoryProvider =
    AutoDisposeProvider<AdminUserRepository>.internal(
      adminUserRepository,
      name: r'adminUserRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$adminUserRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AdminUserRepositoryRef = AutoDisposeProviderRef<AdminUserRepository>;
String _$allUsersHash() => r'd8602f2d63cf5ef21d098adce159eea831423fd0';

/// See also [allUsers].
@ProviderFor(allUsers)
final allUsersProvider = AutoDisposeStreamProvider<List<UserModel>>.internal(
  allUsers,
  name: r'allUsersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$allUsersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AllUsersRef = AutoDisposeStreamProviderRef<List<UserModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
