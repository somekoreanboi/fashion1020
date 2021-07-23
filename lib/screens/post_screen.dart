import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.add_photo_alternate,
              color: Colors.grey,
              size: 150,
            ),
            Padding(
                padding: EdgeInsets.only(top: 20),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text('내 패션 공유하기',
                      style: TextStyle(color: Colors.black, fontSize: 20)),
                  color: Colors.white,
                  onPressed: () => takeImage(context),
                ))
          ],
        ));
  }

  takeImage(mContext) {
    return showDialog(
        context: mContext,
        builder: (context) {
          return SimpleDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            title: Text('공유 방법',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )),
            children: <Widget>[
              SimpleDialogOption(
                child: Text('카메라로 촬영', style: TextStyle(color: Colors.black)),
                onPressed: captureImageWithCamera,
              ),
              SimpleDialogOption(
                child: Text('갤러리에서 선택', style: TextStyle(color: Colors.black)),
                onPressed: pickImageFromGallery,
              ),
              SimpleDialogOption(
                child: Text('취소', style: TextStyle(color: Colors.grey)),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        });
  }

  final ImagePicker _picker = ImagePicker();
  late PickedFile file;

  pickImageFromGallery() async {
    Navigator.pop(context);
    PickedFile? imageFile = await _picker.getImage(
      source: ImageSource.gallery,
      maxHeight: 680,
      maxWidth: 970,
    );
    setState(() {
      this.file = imageFile!;
    });
  }

  captureImageWithCamera() async {
    Navigator.pop(context);
    PickedFile? imageFile = await _picker.getImage(
      source: ImageSource.camera,
      maxHeight: 680,
      maxWidth: 970,
    );
    setState(() {
      this.file = imageFile!;
    });
  }
}
