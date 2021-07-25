import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class PostManager {
  postImage(PickedFile pickedFile) async {
    File image = File(pickedFile.path);
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child("image1" + DateTime.now().toString());
    UploadTask uploadTask = ref.putFile(image);
    uploadTask.whenComplete(() {
      print('upload was successful');
      return;
    }).catchError((onError) {
      print(onError);
    });
  }
}
