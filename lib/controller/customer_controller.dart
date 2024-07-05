import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../constant/methods.dart';
import '../constant/urls.dart';

class CustomerController extends GetxController {
  RxBool isCustomerLoading = false.obs;
  RxBool isGetCustomerLoading = false.obs;
  RxBool isGetCustomerDeleteLoading = false.obs;
  RxBool isGetCustomerUpdateLoading = false.obs;

  TextEditingController companyTextEditingController = TextEditingController();
  TextEditingController ownerTextEditingController = TextEditingController();
  TextEditingController contactTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController websiteTextEditingController = TextEditingController();
  TextEditingController referenceTextEditingController =
      TextEditingController();
  TextEditingController gstinTextEditingController = TextEditingController();
  TextEditingController photoTextEditingController = TextEditingController();
  TextEditingController addressTextEditingController = TextEditingController();

  RxList<dynamic> customerList = <dynamic>[].obs;


  File? imgFile;
  String base64Image = "";

  Future<bool> pickImageFromGallery() async {
    XFile? pickImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickImage != null) {
      imgFile = File(pickImage.path);
      List<int> imageBytes = imgFile!.readAsBytesSync();
      base64Image = base64Encode(imageBytes);
      return true;
    } else {
      return false;
    }
  }

  Future<void> addCustomer() async {
    Map<String, dynamic> body = {
      'company': companyTextEditingController.text,
      'owner': ownerTextEditingController.text,
      'contact': contactTextEditingController.text,
      'email': emailTextEditingController.text,
      'website': websiteTextEditingController.text,
      'reference': referenceTextEditingController.text,
      'gstin': gstinTextEditingController.text,
      'photo': base64Image,
      'address': addressTextEditingController.text,
    };
    try {
      String url = '${baseURL}customer/insert';
      log("API => $url");
      isCustomerLoading.value = true;
      var response = await http.post(Uri.parse(url), body: body);
      if (response.statusCode == 200) {
        jsonDecode(response.body);
        getcustomer();
        Get.back();
        isCustomerLoading.value = false;
      } else {
        debugPrint("statusCode${response.statusCode}");
        isCustomerLoading.value = false;
      }
    } catch (e) {
      debugPrint("Error${e.toString()}");
      isCustomerLoading.value = false;
    }
  }

  Future getcustomer() async {
    try {
      String url = "${baseURL}customer/getAll";
      log("API => $url");
      customerList.clear();
      isGetCustomerLoading.value = true;
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        isGetCustomerLoading.value = false;
        var responseData = jsonDecode(response.body);
        List jobData = responseData["data"];
        // Get.back();
        // getcustomer();
        customerList.value = jobData;
      } else {
        debugPrint("statusCode${response.statusCode}");
        isGetCustomerLoading.value = false;
      }
    } catch (e) {
      debugPrint("Errors:$e");
      isGetCustomerLoading.value = false;
    }
  }

  Future<void> updateCustomer(id) async {
    Map<String, dynamic> body = {
      'company': companyTextEditingController.text,
      'owner': ownerTextEditingController.text,
      'contact': contactTextEditingController.text,
      'email': emailTextEditingController.text,
      'website': websiteTextEditingController.text,
      'reference': referenceTextEditingController.text,
      'gstin': gstinTextEditingController.text,
      'photo': base64Image,
      'address': addressTextEditingController.text,
      "id": id,
    };
    try {
      String url = "${baseURL}customer/update";
      log("API => $url");
      isGetCustomerUpdateLoading.value = true;
      var response = await http.post(Uri.parse(url), body: body);
      if (response.statusCode == 200) {
        jsonDecode(response.body);
        Get.back();
        getcustomer();
        isGetCustomerUpdateLoading.value = false;
      } else {
        debugPrint("statusCode${response.statusCode}");
        isGetCustomerUpdateLoading.value = false;
      }
    } catch (e) {
      debugPrint("Error${e.toString()}");
      isGetCustomerUpdateLoading.value = false;
    }
  }

  Future<void> deletecustomer(id) async {
    try {
      String url = "${baseURL}customer/delete";
      log("API => $url");

      isGetCustomerDeleteLoading.value = true;
      var response = await http.post(Uri.parse(url), body: {"id": id});
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        isGetCustomerDeleteLoading.value = false;
        if (responseData["status"] == 1) {
          showToast(responseData["message"]);
          isGetCustomerDeleteLoading.value = false;
        } else {
          showToast(responseData["message"]);
          isGetCustomerDeleteLoading.value = false;
        }
      } else {
        debugPrint("statusCode===>${response.statusCode}");
        isGetCustomerDeleteLoading.value = false;
      }
    } catch (e) {
      debugPrint("Error:${e.toString()}");
      isGetCustomerDeleteLoading.value = false;
    }
  }
}
