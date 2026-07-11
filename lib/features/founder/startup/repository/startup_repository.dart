import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloudinary_public/cloudinary_public.dart';

import '../../../../core/services/cloudinary_service.dart';
import '../models/startup.dart';
import '../models/startup_mapper.dart';
import '../models/verification_status.dart';

class StartupRepository {
  StartupRepository(this._firestore, this._cloudinary);

  final FirebaseFirestore _firestore;
  final CloudinaryService _cloudinary;

  Stream<Startup> watchStartup(String founderId) {
    return _firestore.collection('startups').doc(founderId).snapshots().map((doc) {
      final data = doc.data();
      if (data == null) return Startup(founderId: founderId);
      return startupFromFirestore(founderId, data);
    });
  }

  Future<void> saveStartup(Startup startup) {
    return _firestore
        .collection('startups')
        .doc(startup.founderId)
        .set(startupToFirestoreMap(startup), SetOptions(merge: true));
  }

  Future<String> uploadLogo(String filePath) {
    return _cloudinary.uploadFile(filePath, folder: 'startup_logos');
  }

  Future<String> uploadVerificationDoc(String filePath) {
    return _cloudinary.uploadFile(
      filePath,
      folder: 'startup_verification',
      resourceType: CloudinaryResourceType.Raw,
    );
  }

  Future<void> submitVerification(String founderId, String docUrl) {
    return _firestore.collection('startups').doc(founderId).update({
      'verificationDocUrl': docUrl,
      'verificationStatus': VerificationStatus.pending.name,
      'verificationRejectionReason': null,
    });
  }
}
