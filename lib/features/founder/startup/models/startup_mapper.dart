import 'hiring_status.dart';
import 'startup.dart';
import 'startup_stage.dart';
import 'verification_status.dart';

Startup startupFromFirestore(String founderId, Map<String, dynamic> data) {
  return Startup(
    founderId: founderId,
    logoUrl: data['logoUrl'] as String?,
    name: data['name'] as String?,
    industry: data['industry'] as String?,
    description: data['description'] as String?,
    website: data['website'] as String?,
    stage: StartupStage.values.byName((data['stage'] as String?) ?? StartupStage.idea.name),
    hiringStatus: HiringStatus.values.byName(
      (data['hiringStatus'] as String?) ?? HiringStatus.notHiring.name,
    ),
    verificationStatus: VerificationStatus.values.byName(
      (data['verificationStatus'] as String?) ?? VerificationStatus.unverified.name,
    ),
    verificationDocUrl: data['verificationDocUrl'] as String?,
    verificationRejectionReason: data['verificationRejectionReason'] as String?,
  );
}

Map<String, dynamic> startupToFirestoreMap(Startup startup) {
  return {
    'founderId': startup.founderId,
    'logoUrl': startup.logoUrl,
    'name': startup.name,
    'industry': startup.industry,
    'description': startup.description,
    'website': startup.website,
    'stage': startup.stage.name,
    'hiringStatus': startup.hiringStatus.name,
    'verificationStatus': startup.verificationStatus.name,
  };
}
