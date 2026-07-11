// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'opportunity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Opportunity {
  String get id => throw _privateConstructorUsedError;
  String get startupId => throw _privateConstructorUsedError;
  String get startupName => throw _privateConstructorUsedError;
  String? get startupLogoUrl => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  List<String> get requiredSkills => throw _privateConstructorUsedError;
  String? get duration => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  bool get isPaid => throw _privateConstructorUsedError;
  bool get isRemote => throw _privateConstructorUsedError;
  DateTime get deadline => throw _privateConstructorUsedError;
  String? get responsibilities => throw _privateConstructorUsedError;
  String? get benefits => throw _privateConstructorUsedError;
  String get applicationEmail => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Create a copy of Opportunity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OpportunityCopyWith<Opportunity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpportunityCopyWith<$Res> {
  factory $OpportunityCopyWith(
    Opportunity value,
    $Res Function(Opportunity) then,
  ) = _$OpportunityCopyWithImpl<$Res, Opportunity>;
  @useResult
  $Res call({
    String id,
    String startupId,
    String startupName,
    String? startupLogoUrl,
    String title,
    String description,
    String category,
    List<String> requiredSkills,
    String? duration,
    String? location,
    bool isPaid,
    bool isRemote,
    DateTime deadline,
    String? responsibilities,
    String? benefits,
    String applicationEmail,
    DateTime createdAt,
  });
}

/// @nodoc
class _$OpportunityCopyWithImpl<$Res, $Val extends Opportunity>
    implements $OpportunityCopyWith<$Res> {
  _$OpportunityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Opportunity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startupId = null,
    Object? startupName = null,
    Object? startupLogoUrl = freezed,
    Object? title = null,
    Object? description = null,
    Object? category = null,
    Object? requiredSkills = null,
    Object? duration = freezed,
    Object? location = freezed,
    Object? isPaid = null,
    Object? isRemote = null,
    Object? deadline = null,
    Object? responsibilities = freezed,
    Object? benefits = freezed,
    Object? applicationEmail = null,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            startupId: null == startupId
                ? _value.startupId
                : startupId // ignore: cast_nullable_to_non_nullable
                      as String,
            startupName: null == startupName
                ? _value.startupName
                : startupName // ignore: cast_nullable_to_non_nullable
                      as String,
            startupLogoUrl: freezed == startupLogoUrl
                ? _value.startupLogoUrl
                : startupLogoUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String,
            requiredSkills: null == requiredSkills
                ? _value.requiredSkills
                : requiredSkills // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            duration: freezed == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                      as String?,
            location: freezed == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String?,
            isPaid: null == isPaid
                ? _value.isPaid
                : isPaid // ignore: cast_nullable_to_non_nullable
                      as bool,
            isRemote: null == isRemote
                ? _value.isRemote
                : isRemote // ignore: cast_nullable_to_non_nullable
                      as bool,
            deadline: null == deadline
                ? _value.deadline
                : deadline // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            responsibilities: freezed == responsibilities
                ? _value.responsibilities
                : responsibilities // ignore: cast_nullable_to_non_nullable
                      as String?,
            benefits: freezed == benefits
                ? _value.benefits
                : benefits // ignore: cast_nullable_to_non_nullable
                      as String?,
            applicationEmail: null == applicationEmail
                ? _value.applicationEmail
                : applicationEmail // ignore: cast_nullable_to_non_nullable
                      as String,
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
abstract class _$$OpportunityImplCopyWith<$Res>
    implements $OpportunityCopyWith<$Res> {
  factory _$$OpportunityImplCopyWith(
    _$OpportunityImpl value,
    $Res Function(_$OpportunityImpl) then,
  ) = __$$OpportunityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String startupId,
    String startupName,
    String? startupLogoUrl,
    String title,
    String description,
    String category,
    List<String> requiredSkills,
    String? duration,
    String? location,
    bool isPaid,
    bool isRemote,
    DateTime deadline,
    String? responsibilities,
    String? benefits,
    String applicationEmail,
    DateTime createdAt,
  });
}

/// @nodoc
class __$$OpportunityImplCopyWithImpl<$Res>
    extends _$OpportunityCopyWithImpl<$Res, _$OpportunityImpl>
    implements _$$OpportunityImplCopyWith<$Res> {
  __$$OpportunityImplCopyWithImpl(
    _$OpportunityImpl _value,
    $Res Function(_$OpportunityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Opportunity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startupId = null,
    Object? startupName = null,
    Object? startupLogoUrl = freezed,
    Object? title = null,
    Object? description = null,
    Object? category = null,
    Object? requiredSkills = null,
    Object? duration = freezed,
    Object? location = freezed,
    Object? isPaid = null,
    Object? isRemote = null,
    Object? deadline = null,
    Object? responsibilities = freezed,
    Object? benefits = freezed,
    Object? applicationEmail = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$OpportunityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        startupId: null == startupId
            ? _value.startupId
            : startupId // ignore: cast_nullable_to_non_nullable
                  as String,
        startupName: null == startupName
            ? _value.startupName
            : startupName // ignore: cast_nullable_to_non_nullable
                  as String,
        startupLogoUrl: freezed == startupLogoUrl
            ? _value.startupLogoUrl
            : startupLogoUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String,
        requiredSkills: null == requiredSkills
            ? _value._requiredSkills
            : requiredSkills // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        duration: freezed == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as String?,
        location: freezed == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String?,
        isPaid: null == isPaid
            ? _value.isPaid
            : isPaid // ignore: cast_nullable_to_non_nullable
                  as bool,
        isRemote: null == isRemote
            ? _value.isRemote
            : isRemote // ignore: cast_nullable_to_non_nullable
                  as bool,
        deadline: null == deadline
            ? _value.deadline
            : deadline // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        responsibilities: freezed == responsibilities
            ? _value.responsibilities
            : responsibilities // ignore: cast_nullable_to_non_nullable
                  as String?,
        benefits: freezed == benefits
            ? _value.benefits
            : benefits // ignore: cast_nullable_to_non_nullable
                  as String?,
        applicationEmail: null == applicationEmail
            ? _value.applicationEmail
            : applicationEmail // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc

class _$OpportunityImpl implements _Opportunity {
  const _$OpportunityImpl({
    required this.id,
    required this.startupId,
    required this.startupName,
    this.startupLogoUrl,
    required this.title,
    required this.description,
    required this.category,
    final List<String> requiredSkills = const <String>[],
    this.duration,
    this.location,
    this.isPaid = false,
    this.isRemote = false,
    required this.deadline,
    this.responsibilities,
    this.benefits,
    this.applicationEmail = '',
    required this.createdAt,
  }) : _requiredSkills = requiredSkills;

  @override
  final String id;
  @override
  final String startupId;
  @override
  final String startupName;
  @override
  final String? startupLogoUrl;
  @override
  final String title;
  @override
  final String description;
  @override
  final String category;
  final List<String> _requiredSkills;
  @override
  @JsonKey()
  List<String> get requiredSkills {
    if (_requiredSkills is EqualUnmodifiableListView) return _requiredSkills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_requiredSkills);
  }

  @override
  final String? duration;
  @override
  final String? location;
  @override
  @JsonKey()
  final bool isPaid;
  @override
  @JsonKey()
  final bool isRemote;
  @override
  final DateTime deadline;
  @override
  final String? responsibilities;
  @override
  final String? benefits;
  @override
  @JsonKey()
  final String applicationEmail;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'Opportunity(id: $id, startupId: $startupId, startupName: $startupName, startupLogoUrl: $startupLogoUrl, title: $title, description: $description, category: $category, requiredSkills: $requiredSkills, duration: $duration, location: $location, isPaid: $isPaid, isRemote: $isRemote, deadline: $deadline, responsibilities: $responsibilities, benefits: $benefits, applicationEmail: $applicationEmail, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpportunityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startupId, startupId) ||
                other.startupId == startupId) &&
            (identical(other.startupName, startupName) ||
                other.startupName == startupName) &&
            (identical(other.startupLogoUrl, startupLogoUrl) ||
                other.startupLogoUrl == startupLogoUrl) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(
              other._requiredSkills,
              _requiredSkills,
            ) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.isPaid, isPaid) || other.isPaid == isPaid) &&
            (identical(other.isRemote, isRemote) ||
                other.isRemote == isRemote) &&
            (identical(other.deadline, deadline) ||
                other.deadline == deadline) &&
            (identical(other.responsibilities, responsibilities) ||
                other.responsibilities == responsibilities) &&
            (identical(other.benefits, benefits) ||
                other.benefits == benefits) &&
            (identical(other.applicationEmail, applicationEmail) ||
                other.applicationEmail == applicationEmail) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    startupId,
    startupName,
    startupLogoUrl,
    title,
    description,
    category,
    const DeepCollectionEquality().hash(_requiredSkills),
    duration,
    location,
    isPaid,
    isRemote,
    deadline,
    responsibilities,
    benefits,
    applicationEmail,
    createdAt,
  );

  /// Create a copy of Opportunity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpportunityImplCopyWith<_$OpportunityImpl> get copyWith =>
      __$$OpportunityImplCopyWithImpl<_$OpportunityImpl>(this, _$identity);
}

abstract class _Opportunity implements Opportunity {
  const factory _Opportunity({
    required final String id,
    required final String startupId,
    required final String startupName,
    final String? startupLogoUrl,
    required final String title,
    required final String description,
    required final String category,
    final List<String> requiredSkills,
    final String? duration,
    final String? location,
    final bool isPaid,
    final bool isRemote,
    required final DateTime deadline,
    final String? responsibilities,
    final String? benefits,
    final String applicationEmail,
    required final DateTime createdAt,
  }) = _$OpportunityImpl;

  @override
  String get id;
  @override
  String get startupId;
  @override
  String get startupName;
  @override
  String? get startupLogoUrl;
  @override
  String get title;
  @override
  String get description;
  @override
  String get category;
  @override
  List<String> get requiredSkills;
  @override
  String? get duration;
  @override
  String? get location;
  @override
  bool get isPaid;
  @override
  bool get isRemote;
  @override
  DateTime get deadline;
  @override
  String? get responsibilities;
  @override
  String? get benefits;
  @override
  String get applicationEmail;
  @override
  DateTime get createdAt;

  /// Create a copy of Opportunity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpportunityImplCopyWith<_$OpportunityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
