import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CloudinaryService {
  CloudinaryService()
    : _cloudinary = CloudinaryPublic(
        dotenv.env['CLOUDINARY_CLOUD_NAME']!,
        dotenv.env['CLOUDINARY_UPLOAD_PRESET']!,
        cache: false,
      );

  final CloudinaryPublic _cloudinary;

  Future<String> uploadFile(String filePath, {String? folder}) async {
    final response = await _cloudinary.uploadFile(
      CloudinaryFile.fromFile(filePath, folder: folder, resourceType: CloudinaryResourceType.Auto),
    );
    return response.secureUrl;
  }
}
