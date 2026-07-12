// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Conversation {
  String get id => throw _privateConstructorUsedError;
  List<String> get participantIds => throw _privateConstructorUsedError;
  Map<String, String> get participantNames =>
      throw _privateConstructorUsedError;
  Map<String, String> get participantPhotoUrls =>
      throw _privateConstructorUsedError;
  String? get opportunityId => throw _privateConstructorUsedError;
  String? get opportunityTitle => throw _privateConstructorUsedError;
  String get lastMessage => throw _privateConstructorUsedError;
  DateTime get lastMessageAt => throw _privateConstructorUsedError;
  String? get lastSenderId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Create a copy of Conversation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConversationCopyWith<Conversation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationCopyWith<$Res> {
  factory $ConversationCopyWith(
    Conversation value,
    $Res Function(Conversation) then,
  ) = _$ConversationCopyWithImpl<$Res, Conversation>;
  @useResult
  $Res call({
    String id,
    List<String> participantIds,
    Map<String, String> participantNames,
    Map<String, String> participantPhotoUrls,
    String? opportunityId,
    String? opportunityTitle,
    String lastMessage,
    DateTime lastMessageAt,
    String? lastSenderId,
    DateTime createdAt,
  });
}

/// @nodoc
class _$ConversationCopyWithImpl<$Res, $Val extends Conversation>
    implements $ConversationCopyWith<$Res> {
  _$ConversationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Conversation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? participantIds = null,
    Object? participantNames = null,
    Object? participantPhotoUrls = null,
    Object? opportunityId = freezed,
    Object? opportunityTitle = freezed,
    Object? lastMessage = null,
    Object? lastMessageAt = null,
    Object? lastSenderId = freezed,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            participantIds: null == participantIds
                ? _value.participantIds
                : participantIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            participantNames: null == participantNames
                ? _value.participantNames
                : participantNames // ignore: cast_nullable_to_non_nullable
                      as Map<String, String>,
            participantPhotoUrls: null == participantPhotoUrls
                ? _value.participantPhotoUrls
                : participantPhotoUrls // ignore: cast_nullable_to_non_nullable
                      as Map<String, String>,
            opportunityId: freezed == opportunityId
                ? _value.opportunityId
                : opportunityId // ignore: cast_nullable_to_non_nullable
                      as String?,
            opportunityTitle: freezed == opportunityTitle
                ? _value.opportunityTitle
                : opportunityTitle // ignore: cast_nullable_to_non_nullable
                      as String?,
            lastMessage: null == lastMessage
                ? _value.lastMessage
                : lastMessage // ignore: cast_nullable_to_non_nullable
                      as String,
            lastMessageAt: null == lastMessageAt
                ? _value.lastMessageAt
                : lastMessageAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            lastSenderId: freezed == lastSenderId
                ? _value.lastSenderId
                : lastSenderId // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ConversationImplCopyWith<$Res>
    implements $ConversationCopyWith<$Res> {
  factory _$$ConversationImplCopyWith(
    _$ConversationImpl value,
    $Res Function(_$ConversationImpl) then,
  ) = __$$ConversationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    List<String> participantIds,
    Map<String, String> participantNames,
    Map<String, String> participantPhotoUrls,
    String? opportunityId,
    String? opportunityTitle,
    String lastMessage,
    DateTime lastMessageAt,
    String? lastSenderId,
    DateTime createdAt,
  });
}

/// @nodoc
class __$$ConversationImplCopyWithImpl<$Res>
    extends _$ConversationCopyWithImpl<$Res, _$ConversationImpl>
    implements _$$ConversationImplCopyWith<$Res> {
  __$$ConversationImplCopyWithImpl(
    _$ConversationImpl _value,
    $Res Function(_$ConversationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Conversation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? participantIds = null,
    Object? participantNames = null,
    Object? participantPhotoUrls = null,
    Object? opportunityId = freezed,
    Object? opportunityTitle = freezed,
    Object? lastMessage = null,
    Object? lastMessageAt = null,
    Object? lastSenderId = freezed,
    Object? createdAt = null,
  }) {
    return _then(
      _$ConversationImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        participantIds: null == participantIds
            ? _value._participantIds
            : participantIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        participantNames: null == participantNames
            ? _value._participantNames
            : participantNames // ignore: cast_nullable_to_non_nullable
                  as Map<String, String>,
        participantPhotoUrls: null == participantPhotoUrls
            ? _value._participantPhotoUrls
            : participantPhotoUrls // ignore: cast_nullable_to_non_nullable
                  as Map<String, String>,
        opportunityId: freezed == opportunityId
            ? _value.opportunityId
            : opportunityId // ignore: cast_nullable_to_non_nullable
                  as String?,
        opportunityTitle: freezed == opportunityTitle
            ? _value.opportunityTitle
            : opportunityTitle // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastMessage: null == lastMessage
            ? _value.lastMessage
            : lastMessage // ignore: cast_nullable_to_non_nullable
                  as String,
        lastMessageAt: null == lastMessageAt
            ? _value.lastMessageAt
            : lastMessageAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        lastSenderId: freezed == lastSenderId
            ? _value.lastSenderId
            : lastSenderId // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc

class _$ConversationImpl implements _Conversation {
  const _$ConversationImpl({
    required this.id,
    required final List<String> participantIds,
    final Map<String, String> participantNames = const <String, String>{},
    final Map<String, String> participantPhotoUrls = const <String, String>{},
    this.opportunityId,
    this.opportunityTitle,
    this.lastMessage = '',
    required this.lastMessageAt,
    this.lastSenderId,
    required this.createdAt,
  }) : _participantIds = participantIds,
       _participantNames = participantNames,
       _participantPhotoUrls = participantPhotoUrls;

  @override
  final String id;
  final List<String> _participantIds;
  @override
  List<String> get participantIds {
    if (_participantIds is EqualUnmodifiableListView) return _participantIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_participantIds);
  }

  final Map<String, String> _participantNames;
  @override
  @JsonKey()
  Map<String, String> get participantNames {
    if (_participantNames is EqualUnmodifiableMapView) return _participantNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_participantNames);
  }

  final Map<String, String> _participantPhotoUrls;
  @override
  @JsonKey()
  Map<String, String> get participantPhotoUrls {
    if (_participantPhotoUrls is EqualUnmodifiableMapView)
      return _participantPhotoUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_participantPhotoUrls);
  }

  @override
  final String? opportunityId;
  @override
  final String? opportunityTitle;
  @override
  @JsonKey()
  final String lastMessage;
  @override
  final DateTime lastMessageAt;
  @override
  final String? lastSenderId;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'Conversation(id: $id, participantIds: $participantIds, participantNames: $participantNames, participantPhotoUrls: $participantPhotoUrls, opportunityId: $opportunityId, opportunityTitle: $opportunityTitle, lastMessage: $lastMessage, lastMessageAt: $lastMessageAt, lastSenderId: $lastSenderId, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConversationImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(
              other._participantIds,
              _participantIds,
            ) &&
            const DeepCollectionEquality().equals(
              other._participantNames,
              _participantNames,
            ) &&
            const DeepCollectionEquality().equals(
              other._participantPhotoUrls,
              _participantPhotoUrls,
            ) &&
            (identical(other.opportunityId, opportunityId) ||
                other.opportunityId == opportunityId) &&
            (identical(other.opportunityTitle, opportunityTitle) ||
                other.opportunityTitle == opportunityTitle) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            (identical(other.lastMessageAt, lastMessageAt) ||
                other.lastMessageAt == lastMessageAt) &&
            (identical(other.lastSenderId, lastSenderId) ||
                other.lastSenderId == lastSenderId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    const DeepCollectionEquality().hash(_participantIds),
    const DeepCollectionEquality().hash(_participantNames),
    const DeepCollectionEquality().hash(_participantPhotoUrls),
    opportunityId,
    opportunityTitle,
    lastMessage,
    lastMessageAt,
    lastSenderId,
    createdAt,
  );

  /// Create a copy of Conversation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConversationImplCopyWith<_$ConversationImpl> get copyWith =>
      __$$ConversationImplCopyWithImpl<_$ConversationImpl>(this, _$identity);
}

abstract class _Conversation implements Conversation {
  const factory _Conversation({
    required final String id,
    required final List<String> participantIds,
    final Map<String, String> participantNames,
    final Map<String, String> participantPhotoUrls,
    final String? opportunityId,
    final String? opportunityTitle,
    final String lastMessage,
    required final DateTime lastMessageAt,
    final String? lastSenderId,
    required final DateTime createdAt,
  }) = _$ConversationImpl;

  @override
  String get id;
  @override
  List<String> get participantIds;
  @override
  Map<String, String> get participantNames;
  @override
  Map<String, String> get participantPhotoUrls;
  @override
  String? get opportunityId;
  @override
  String? get opportunityTitle;
  @override
  String get lastMessage;
  @override
  DateTime get lastMessageAt;
  @override
  String? get lastSenderId;
  @override
  DateTime get createdAt;

  /// Create a copy of Conversation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConversationImplCopyWith<_$ConversationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
