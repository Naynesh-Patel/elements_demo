import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SalesmenController extends GetxController {
  File? imgFile;

  TextEditingController workerTextEditingController = TextEditingController();
  TextEditingController salesmenNameTextEditingController =
      TextEditingController();
  TextEditingController contactNoTextEditingController =
      TextEditingController();

  Future<bool> pickImageFromGallery() async {
    XFile? pickImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickImage != null) {
      imgFile = File(pickImage.path);
      return true;
    } else {
      return false;
    }
  }
}
