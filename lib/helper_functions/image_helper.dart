import 'package:image_picker/image_picker.dart';

class ImageHelper {
  static final ImagePicker _picker = ImagePicker();

  static Future<XFile?> pickImageFromGallery() async {
    final XFile? pickFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    return pickFile;
  }
}
