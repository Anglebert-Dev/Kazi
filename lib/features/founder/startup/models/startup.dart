import 'package:freezed_annotation/freezed_annotation.dart';

import 'hiring_status.dart';
import 'verification_status.dart';

part 'startup.freezed.dart';

@freezed
class Startup with _$Startup {
  const factory Startup({
    required String founderId,
    String? logoUrl,
    String? name,
    String? industry,
    String? description,
    String? website,
    String? stage,
    @Default(HiringStatus.notHiring) HiringStatus hiringStatus,
    @Default(VerificationStatus.unverified) VerificationStatus verificationStatus,
    @Default(<String, String>{}) Map<String, String> verificationDocUrls,
    String? verificationRejectionReason,
  }) = _Startup;
}
