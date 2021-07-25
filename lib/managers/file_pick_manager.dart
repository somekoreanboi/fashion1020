import 'dart:io';

import 'package:image_picker/image_picker.dart';

class FilePickManager {
  final ImagePicker _picker = ImagePicker();

  Future<PickedFile?> captureImage(bool isCamera) async {
    PickedFile? imageFile;
    if (isCamera) {
      imageFile = await _picker.getImage(
        source: ImageSource.camera,
        maxHeight: 680,
        maxWidth: 970,
      );
    } else {
      imageFile = await _picker.getImage(
        source: ImageSource.gallery,
        maxHeight: 680,
        maxWidth: 970,
      );
    }

    return imageFile;
  }
}
