import 'package:cloud_firestore/cloud_firestore.dart';

import 'opportunity.dart';

Opportunity opportunityFromFirestore(String id, Map<String, dynamic> data) {
  return Opportunity(
    id: id,
    startupId: data['startupId'] as String,
    startupName: data['startupName'] as String? ?? '',
    startupLogoUrl: data['startupLogoUrl'] as String?,
    title: data['title'] as String? ?? '',
    description: data['description'] as String? ?? '',
    category: data['category'] as String? ?? '',
    requiredSkills: List<String>.from(data['requiredSkills'] as List? ?? const []),
    duration: data['duration'] as String?,
    location: data['location'] as String?,
    isPaid: data['isPaid'] as bool? ?? false,
    isRemote: data['isRemote'] as bool? ?? false,
    deadline: (data['deadline'] as Timestamp?)?.toDate() ?? DateTime.now(),
    responsibilities: data['responsibilities'] as String?,
    benefits: data['benefits'] as String?,
    applicationEmail: data['applicationEmail'] as String? ?? '',
    createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
  );
}

Map<String, dynamic> opportunityToMap(Opportunity opportunity) {
  return {
    'startupId': opportunity.startupId,
    'startupName': opportunity.startupName,
    'startupLogoUrl': opportunity.startupLogoUrl,
    'title': opportunity.title,
    'description': opportunity.description,
    'category': opportunity.category,
    'requiredSkills': opportunity.requiredSkills,
    'duration': opportunity.duration,
    'location': opportunity.location,
    'isPaid': opportunity.isPaid,
    'isRemote': opportunity.isRemote,
    'deadline': Timestamp.fromDate(opportunity.deadline),
    'responsibilities': opportunity.responsibilities,
    'benefits': opportunity.benefits,
    'applicationEmail': opportunity.applicationEmail,
    'createdAt': FieldValue.serverTimestamp(),
  };
}
