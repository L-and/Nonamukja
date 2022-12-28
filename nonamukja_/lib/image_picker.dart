import 'dart:io';
import 'dart:ui';
import 'package:image_picker/image_picker.dart';

class MyImagePicker {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  SetImageFromCam() async { // 카메라로 이미지 설정
    var image = await _picker.pickImage(source: ImageSource.camera);

    if(image != null) {
      _image = image;
    }
  }

  SetImageFromGallery() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);

    if(image != null) {
      _image = image;
    }
  }

  GetImage() {
    if(_image != null) {
      return _image;
    } else {
      return null;
    }
  }
}