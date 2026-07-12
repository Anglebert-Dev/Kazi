// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$notificationRepositoryHash() =>
    r'27c9d3bde592f511f7cf2b8035766c44c9f5bd00';

/// See also [notificationRepository].
@ProviderFor(notificationRepository)
final notificationRepositoryProvider =
    AutoDisposeProvider<NotificationRepository>.internal(
      notificationRepository,
      name: r'notificationRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$notificationRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef NotificationRepositoryRef =
    AutoDisposeProviderRef<NotificationRepository>;
String _$notificationsForUserHash() =>
    r'56c7734161a04d9e3076582eeea430bed7e7f65f';

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

/// See also [notificationsForUser].
@ProviderFor(notificationsForUser)
const notificationsForUserProvider = NotificationsForUserFamily();

/// See also [notificationsForUser].
class NotificationsForUserFamily
    extends Family<AsyncValue<List<AppNotification>>> {
  /// See also [notificationsForUser].
  const NotificationsForUserFamily();

  /// See also [notificationsForUser].
  NotificationsForUserProvider call(String uid) {
    return NotificationsForUserProvider(uid);
  }

  @override
  NotificationsForUserProvider getProviderOverride(
    covariant NotificationsForUserProvider provider,
  ) {
    return call(provider.uid);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'notificationsForUserProvider';
}

/// See also [notificationsForUser].
class NotificationsForUserProvider
    extends AutoDisposeStreamProvider<List<AppNotification>> {
  /// See also [notificationsForUser].
  NotificationsForUserProvider(String uid)
    : this._internal(
        (ref) => notificationsForUser(ref as NotificationsForUserRef, uid),
        from: notificationsForUserProvider,
        name: r'notificationsForUserProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$notificationsForUserHash,
        dependencies: NotificationsForUserFamily._dependencies,
        allTransitiveDependencies:
            NotificationsForUserFamily._allTransitiveDependencies,
        uid: uid,
      );

  NotificationsForUserProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.uid,
  }) : super.internal();

  final String uid;

  @override
  Override overrideWith(
    Stream<List<AppNotification>> Function(NotificationsForUserRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: NotificationsForUserProvider._internal(
        (ref) => create(ref as NotificationsForUserRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        uid: uid,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<AppNotification>> createElement() {
    return _NotificationsForUserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NotificationsForUserProvider && other.uid == uid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uid.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin NotificationsForUserRef
    on AutoDisposeStreamProviderRef<List<AppNotification>> {
  /// The parameter `uid` of this provider.
  String get uid;
}

class _NotificationsForUserProviderElement
    extends AutoDisposeStreamProviderElement<List<AppNotification>>
    with NotificationsForUserRef {
  _NotificationsForUserProviderElement(super.provider);

  @override
  String get uid => (origin as NotificationsForUserProvider).uid;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
