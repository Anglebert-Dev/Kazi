import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloudinary_public/cloudinary_public.dart';

import '../../../../core/services/cloudinary_service.dart';
import '../models/availability_status.dart';
import '../models/student_profile.dart';

class StudentProfileRepository {
  StudentProfileRepository(this._firestore, this._cloudinary);

  final FirebaseFirestore _firestore;
  final CloudinaryService _cloudinary;

  Stream<StudentProfile> watchProfile(String uid) {
    return _firestore.collection('users').doc(uid).snapshots().map(_fromDoc);
  }

  Future<void> saveProfile(String uid, StudentProfile profile) {
    return _firestore
        .collection('users')
        .doc(uid)
        .set(_toMap(profile), SetOptions(merge: true));
  }

  Future<String> uploadAvatar(String filePath) {
    return _cloudinary.uploadFile(filePath, folder: 'avatars');
  }

  Future<String> uploadCv(String filePath) {
    return _cloudinary.uploadFile(
      filePath,
      folder: 'cvs',
      resourceType: CloudinaryResourceType.Raw,
    );
  }

  StudentProfile _fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data() ?? const {};
    return StudentProfile(
      photoUrl: data['photoUrl'] as String?,
      bio: data['bio'] as String?,
      degree: data['degree'] as String?,
      graduationYear: data['graduationYear'] as int?,
      skills: List<String>.from(data['skills'] as List? ?? const []),
      interests: List<String>.from(data['interests'] as List? ?? const []),
      portfolioUrl: data['portfolioUrl'] as String?,
      githubUrl: data['githubUrl'] as String?,
      linkedinUrl: data['linkedinUrl'] as String?,
      cvUrl: data['cvUrl'] as String?,
      availability: AvailabilityStatus.values.byName(
        (data['availability'] as String?) ?? AvailabilityStatus.available.name,
      ),
    );
  }

  Map<String, dynamic> _toMap(StudentProfile profile) {
    return {
      'photoUrl': profile.photoUrl,
      'bio': profile.bio,
      'degree': profile.degree,
      'graduationYear': profile.graduationYear,
      'skills': profile.skills,
      'interests': profile.interests,
      'portfolioUrl': profile.portfolioUrl,
      'githubUrl': profile.githubUrl,
      'linkedinUrl': profile.linkedinUrl,
      'cvUrl': profile.cvUrl,
      'availability': profile.availability.name,
    };
  }
}
