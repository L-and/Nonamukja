import 'dart:io';
import 'dart:ui';
import 'package:image_picker/image_picker.dart';

class ImageUploader {
  final ImagePicker _picker = ImagePicker();
  XFile? image;

  SetImage() async {
    image = await _picker.pickImage(source: ImageSource.gallery);
  }
}