import 'package:freezed_annotation/freezed_annotation.dart';

part 'opportunity.freezed.dart';

@freezed
class Opportunity with _$Opportunity {
  const factory Opportunity({
    required String id,
    required String startupId,
    required String startupName,
    String? startupLogoUrl,
    required String title,
    required String description,
    required String category,
    @Default(<String>[]) List<String> requiredSkills,
    String? duration,
    String? location,
    @Default(false) bool isPaid,
    @Default(false) bool isRemote,
    required DateTime deadline,
    String? responsibilities,
    String? benefits,
    @Default('') String applicationEmail,
    @Default(false) bool isClosed,
    required DateTime createdAt,
  }) = _Opportunity;

  const Opportunity._();

  bool get isAcceptingApplications => !isClosed && deadline.isAfter(DateTime.now());

  String get applicationStatusLabel {
    if (isClosed) return 'Applications closed';
    if (!deadline.isAfter(DateTime.now())) return 'Deadline passed';
    return 'Open';
  }

  static Opportunity draft({
    required String startupId,
    required String startupName,
    String? startupLogoUrl,
    required DateTime deadline,
  }) {
    return Opportunity(
      id: '',
      startupId: startupId,
      startupName: startupName,
      startupLogoUrl: startupLogoUrl,
      title: '',
      description: '',
      category: '',
      deadline: deadline,
      createdAt: DateTime.now(),
    );
  }
}
