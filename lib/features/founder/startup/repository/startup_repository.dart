import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/services/cloudinary_service.dart';
import '../models/hiring_status.dart';
import '../models/startup.dart';
import '../models/startup_stage.dart';
import '../models/verification_status.dart';

class StartupRepository {
  StartupRepository(this._firestore, this._cloudinary);

  final FirebaseFirestore _firestore;
  final CloudinaryService _cloudinary;

  Stream<Startup> watchStartup(String founderId) {
    return _firestore.collection('startups').doc(founderId).snapshots().map((doc) {
      final data = doc.data();
      if (data == null) return Startup(founderId: founderId);
      return _fromDoc(founderId, data);
    });
  }

  Future<void> saveStartup(Startup startup) {
    return _firestore
        .collection('startups')
        .doc(startup.founderId)
        .set(_toMap(startup), SetOptions(merge: true));
  }

  Future<String> uploadLogo(String filePath) {
    return _cloudinary.uploadFile(filePath, folder: 'startup_logos');
  }

  Startup _fromDoc(String founderId, Map<String, dynamic> data) {
    return Startup(
      founderId: founderId,
      logoUrl: data['logoUrl'] as String?,
      name: data['name'] as String?,
      industry: data['industry'] as String?,
      description: data['description'] as String?,
      website: data['website'] as String?,
      stage: StartupStage.values.byName(
        (data['stage'] as String?) ?? StartupStage.idea.name,
      ),
      hiringStatus: HiringStatus.values.byName(
        (data['hiringStatus'] as String?) ?? HiringStatus.notHiring.name,
      ),
      verificationStatus: VerificationStatus.values.byName(
        (data['verificationStatus'] as String?) ?? VerificationStatus.unverified.name,
      ),
    );
  }

  Map<String, dynamic> _toMap(Startup startup) {
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
}
