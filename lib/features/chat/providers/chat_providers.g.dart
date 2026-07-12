// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chatRepositoryHash() => r'83100ab83bfd07c8fee6adb16071887b14cebb49';

/// See also [chatRepository].
@ProviderFor(chatRepository)
final chatRepositoryProvider = AutoDisposeProvider<ChatRepository>.internal(
  chatRepository,
  name: r'chatRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$chatRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ChatRepositoryRef = AutoDisposeProviderRef<ChatRepository>;
String _$conversationsHash() => r'9f912efe50a1877e47099690a6692efbf0575a49';

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

/// See also [conversations].
@ProviderFor(conversations)
const conversationsProvider = ConversationsFamily();

/// See also [conversations].
class ConversationsFamily extends Family<AsyncValue<List<Conversation>>> {
  /// See also [conversations].
  const ConversationsFamily();

  /// See also [conversations].
  ConversationsProvider call(String uid) {
    return ConversationsProvider(uid);
  }

  @override
  ConversationsProvider getProviderOverride(
    covariant ConversationsProvider provider,
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
  String? get name => r'conversationsProvider';
}

/// See also [conversations].
class ConversationsProvider
    extends AutoDisposeStreamProvider<List<Conversation>> {
  /// See also [conversations].
  ConversationsProvider(String uid)
    : this._internal(
        (ref) => conversations(ref as ConversationsRef, uid),
        from: conversationsProvider,
        name: r'conversationsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$conversationsHash,
        dependencies: ConversationsFamily._dependencies,
        allTransitiveDependencies:
            ConversationsFamily._allTransitiveDependencies,
        uid: uid,
      );

  ConversationsProvider._internal(
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
    Stream<List<Conversation>> Function(ConversationsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ConversationsProvider._internal(
        (ref) => create(ref as ConversationsRef),
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
  AutoDisposeStreamProviderElement<List<Conversation>> createElement() {
    return _ConversationsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ConversationsProvider && other.uid == uid;
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
mixin ConversationsRef on AutoDisposeStreamProviderRef<List<Conversation>> {
  /// The parameter `uid` of this provider.
  String get uid;
}

class _ConversationsProviderElement
    extends AutoDisposeStreamProviderElement<List<Conversation>>
    with ConversationsRef {
  _ConversationsProviderElement(super.provider);

  @override
  String get uid => (origin as ConversationsProvider).uid;
}

String _$conversationByIdHash() => r'ee060c965ef29256690f7e3b5bdfc6a508502ca1';

/// See also [conversationById].
@ProviderFor(conversationById)
const conversationByIdProvider = ConversationByIdFamily();

/// See also [conversationById].
class ConversationByIdFamily extends Family<AsyncValue<Conversation?>> {
  /// See also [conversationById].
  const ConversationByIdFamily();

  /// See also [conversationById].
  ConversationByIdProvider call(String conversationId) {
    return ConversationByIdProvider(conversationId);
  }

  @override
  ConversationByIdProvider getProviderOverride(
    covariant ConversationByIdProvider provider,
  ) {
    return call(provider.conversationId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'conversationByIdProvider';
}

/// See also [conversationById].
class ConversationByIdProvider
    extends AutoDisposeStreamProvider<Conversation?> {
  /// See also [conversationById].
  ConversationByIdProvider(String conversationId)
    : this._internal(
        (ref) => conversationById(ref as ConversationByIdRef, conversationId),
        from: conversationByIdProvider,
        name: r'conversationByIdProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$conversationByIdHash,
        dependencies: ConversationByIdFamily._dependencies,
        allTransitiveDependencies:
            ConversationByIdFamily._allTransitiveDependencies,
        conversationId: conversationId,
      );

  ConversationByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.conversationId,
  }) : super.internal();

  final String conversationId;

  @override
  Override overrideWith(
    Stream<Conversation?> Function(ConversationByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ConversationByIdProvider._internal(
        (ref) => create(ref as ConversationByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        conversationId: conversationId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<Conversation?> createElement() {
    return _ConversationByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ConversationByIdProvider &&
        other.conversationId == conversationId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, conversationId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ConversationByIdRef on AutoDisposeStreamProviderRef<Conversation?> {
  /// The parameter `conversationId` of this provider.
  String get conversationId;
}

class _ConversationByIdProviderElement
    extends AutoDisposeStreamProviderElement<Conversation?>
    with ConversationByIdRef {
  _ConversationByIdProviderElement(super.provider);

  @override
  String get conversationId =>
      (origin as ConversationByIdProvider).conversationId;
}

String _$messagesHash() => r'138d39df4832be8ed37f1c1deeda40f15d42cfa4';

/// See also [messages].
@ProviderFor(messages)
const messagesProvider = MessagesFamily();

/// See also [messages].
class MessagesFamily extends Family<AsyncValue<List<ChatMessage>>> {
  /// See also [messages].
  const MessagesFamily();

  /// See also [messages].
  MessagesProvider call(String conversationId) {
    return MessagesProvider(conversationId);
  }

  @override
  MessagesProvider getProviderOverride(covariant MessagesProvider provider) {
    return call(provider.conversationId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'messagesProvider';
}

/// See also [messages].
class MessagesProvider extends AutoDisposeStreamProvider<List<ChatMessage>> {
  /// See also [messages].
  MessagesProvider(String conversationId)
    : this._internal(
        (ref) => messages(ref as MessagesRef, conversationId),
        from: messagesProvider,
        name: r'messagesProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$messagesHash,
        dependencies: MessagesFamily._dependencies,
        allTransitiveDependencies: MessagesFamily._allTransitiveDependencies,
        conversationId: conversationId,
      );

  MessagesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.conversationId,
  }) : super.internal();

  final String conversationId;

  @override
  Override overrideWith(
    Stream<List<ChatMessage>> Function(MessagesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MessagesProvider._internal(
        (ref) => create(ref as MessagesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        conversationId: conversationId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<ChatMessage>> createElement() {
    return _MessagesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MessagesProvider && other.conversationId == conversationId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, conversationId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin MessagesRef on AutoDisposeStreamProviderRef<List<ChatMessage>> {
  /// The parameter `conversationId` of this provider.
  String get conversationId;
}

class _MessagesProviderElement
    extends AutoDisposeStreamProviderElement<List<ChatMessage>>
    with MessagesRef {
  _MessagesProviderElement(super.provider);

  @override
  String get conversationId => (origin as MessagesProvider).conversationId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
