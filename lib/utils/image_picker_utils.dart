import 'package:image_picker/image_picker.dart';

class ImagePickerUtils {
  final ImagePicker imagePicker = ImagePicker();
  Future<XFile?> cameraCapture() async {
    final XFile? file = await ImagePicker().pickImage(source: ImageSource.camera);
    return file;
  }
  Future<XFile?> galleryCapture() async {
    final XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    return file;
  }
}
