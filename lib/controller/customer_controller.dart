import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../constant/urls.dart';

class CustomerController extends GetxController {

  TextEditingController companyTextEditingController = TextEditingController();
  TextEditingController ownerTextEditingController = TextEditingController();
  TextEditingController contactTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController websiteTextEditingController = TextEditingController();
  TextEditingController referenceTextEditingController = TextEditingController();
  TextEditingController gstinTextEditingController = TextEditingController();
  TextEditingController photoTextEditingController = TextEditingController();

  File? imgFile;

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
  
  Future<void> addCustomer()async {
    String url = '${baseURL}customer/update';
    log("API => $url");

    Map<String,dynamic> body = {
      'company' : companyTextEditingController.text,
      'owner' : companyTextEditingController.text,
      'contact' : companyTextEditingController.text,
      'email' : companyTextEditingController.text,
      'website' : companyTextEditingController.text,
      'reference' : companyTextEditingController.text,
      'gstin' : companyTextEditingController.text,
      'photo' : companyTextEditingController.text,
    };
    
    var response = await http.post(Uri.parse(url),body: body);
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      data = body;
    }
  }
}
