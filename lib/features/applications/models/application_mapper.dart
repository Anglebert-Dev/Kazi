import 'package:cloud_firestore/cloud_firestore.dart';

import 'application.dart';
import 'application_status.dart';

Application applicationFromFirestore(String id, Map<String, dynamic> data) {
  return Application(
    id: id,
    opportunityId: data['opportunityId'] as String? ?? '',
    opportunityTitle: data['opportunityTitle'] as String? ?? '',
    startupId: data['startupId'] as String? ?? '',
    startupName: data['startupName'] as String? ?? '',
    startupLogoUrl: data['startupLogoUrl'] as String?,
    studentId: data['studentId'] as String? ?? '',
    studentName: data['studentName'] as String? ?? '',
    studentPhotoUrl: data['studentPhotoUrl'] as String?,
    coverNote: data['coverNote'] as String? ?? '',
    cvUrl: data['cvUrl'] as String? ?? '',
    portfolioLink: data['portfolioLink'] as String?,
    status: ApplicationStatus.values.byName(data['status'] as String? ?? 'applied'),
    createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
  );
}

Map<String, dynamic> applicationToMap(Application application) {
  return {
    'opportunityId': application.opportunityId,
    'opportunityTitle': application.opportunityTitle,
    'startupId': application.startupId,
    'startupName': application.startupName,
    'startupLogoUrl': application.startupLogoUrl,
    'studentId': application.studentId,
    'studentName': application.studentName,
    'studentPhotoUrl': application.studentPhotoUrl,
    'coverNote': application.coverNote,
    'cvUrl': application.cvUrl,
    'portfolioLink': application.portfolioLink,
    'status': application.status.name,
    'createdAt': FieldValue.serverTimestamp(),
  };
}
