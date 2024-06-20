import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CustomerController extends GetxController{


  File? imgFile;











  Future<bool> pickImageFromGallery() async {

   XFile? _pickImage =  await ImagePicker().pickImage(source: ImageSource.gallery);
    if(_pickImage != null){
      imgFile = File(_pickImage.path);
      return true;
    }else{
      return false;
    }

  }



}