import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_role.dart';
import 'user_status.dart';

part 'user_model.freezed.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String uid,
    required String email,
    String? displayName,
    UserRole? role,
    @Default(UserStatus.active) UserStatus status,
    required DateTime createdAt,
  }) = _UserModel;
}
