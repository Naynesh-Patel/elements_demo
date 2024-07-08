import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
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
  late Uint8List bytes;

  Future<bool> pickImageFromGallery() async {
    XFile? pickImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickImage != null) {
      imgFile = File(pickImage.path);
      imageToBase64(file:imgFile!);
      // bytes = await imgFile!.readAsBytes();
      // List<int> imageBytes = await imgFile!.readAsBytes();
      // base64Image = base64Encode(imageBytes);
      return true;
    } else {
      return false;
    }
  }

  imageToBase64({required File file}) async {
    Uint8List bytes = await file.readAsBytes();
    base64Image = '${base64.encode(bytes)}';
  }


  // Uint8List base64ToImage(String base64String) {
  //   // If the base64 string contains the prefix, remove it
  //   if (base64String.startsWith('data:image')) {
  //     final startIndex = base64String.indexOf('base64,') + 7;
  //     base64String = base64String.substring(startIndex);
  //   }
  //   return base64Decode(base64String);
  // }

  base64ToImage(String string){
    return base64Decode(string.split(',').last);
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


  // Uint8List base64ToImage(String base64String) {
  //   String cleanBase64 = base64String.replaceAll('\n', '').replaceAll('\r', '').replaceAll(' ', '');
  //
  //   // Ensure the string length is a multiple of four
  //   int remainder = cleanBase64.length % 4;
  //   while (cleanBase64.length % 4 != 0) {
  //     cleanBase64 = cleanBase64.padRight(cleanBase64.length + (4 - remainder), '=');
  //   }
  //
  //   return base64Decode(cleanBase64);
  //   }

  decodeB64ToUtf8(String message) {
    String cleanBase64 = message.replaceAll('\n', '').replaceAll('\r', '').replaceAll(' ', '').replaceAll(" ", "+");
    return base64Decode(message);
  }

  String padBase64(String rawBase64) {
    return (rawBase64.length % 4 > 0)
        ? rawBase64 += List.filled(4 - (rawBase64.length % 4), "_").join("")
        : rawBase64;
  }


}
