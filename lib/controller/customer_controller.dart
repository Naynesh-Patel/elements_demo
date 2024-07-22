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
  TextEditingController id = TextEditingController();
  TextEditingController machineNameTextEditingController =
      TextEditingController();
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
      imageToBase64(file: imgFile!);
      return true;
    } else {
      return false;
    }
  }

  imageToBase64({required File file}) async {
    Uint8List bytes = await file.readAsBytes();
    base64Image = base64.encode(bytes);
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
        getCustomer();
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

  Future getCustomer() async {
    try {
      String url = "${baseURL}customer/getAll";
      log("API => $url");
      customerList.clear();
      isGetCustomerLoading.value = true;
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        if (responseData['status'] == "success") {
          List jobData = responseData["data"];
          customerList.value = jobData;
          isGetCustomerLoading.value = false;
        } else {
          debugPrint("Error ${responseData['error']}");
          isGetCustomerLoading.value = false;
        }
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
      isCustomerLoading.value = true;
      var response = await http.post(Uri.parse(url), body: body);
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        if (responseData['status'] == 1) {
          isCustomerLoading.value = false;
          Get.back();
          getCustomer();
        } else {
          debugPrint("Error${responseData['message']}");
          isCustomerLoading.value = false;
        }
      } else {
        debugPrint("statusCode${response.statusCode}");
        isCustomerLoading.value = false;
      }
    } catch (e) {
      debugPrint("Error${e.toString()}");
      isCustomerLoading.value = false;
    }
  }

  Future<void> deleteCustomer({required int index}) async {
    try {
      String url = "${baseURL}customer/delete";
      log("API => $url");
      isGetCustomerDeleteLoading.value = true;
      var response = await http
          .post(Uri.parse(url), body: {"id": customerList[index]['id']});
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        isGetCustomerDeleteLoading.value = false;
        if (responseData["status"] == 1) {
          customerList.removeAt(index);
          Get.back();
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
