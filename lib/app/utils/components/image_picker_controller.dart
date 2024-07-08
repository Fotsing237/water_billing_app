import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  Rx<File> image = File('').obs;

  Future pickedImage() async {
    try {
      final imagePicked =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (imagePicked == null) {
        return;
      } else {
        final imageTemp = File(imagePicked.path);
        image.value = imageTemp;
      }
    } on PlatformException catch (e) {
      return e;
    }
  }
}
