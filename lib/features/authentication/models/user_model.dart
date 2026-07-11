import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_role.dart';

part 'user_model.freezed.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String uid,
    required String email,
    String? displayName,
    UserRole? role,
    required DateTime createdAt,
  }) = _UserModel;
}
