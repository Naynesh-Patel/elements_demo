import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../constant/methods.dart';
import '../constant/urls.dart';
import '../constant/vars.dart';

class OrderController extends GetxController {
  TextEditingController customerCompanyIdNoTextEditingController = TextEditingController();
  TextEditingController machineIdsTextEditingController = TextEditingController();
  TextEditingController deliveryDateTextEditingController = TextEditingController();
  TextEditingController totalPaymentEditingController = TextEditingController();
  TextEditingController advancePaymentEditingController = TextEditingController();
  TextEditingController assignOrderIdEditingController = TextEditingController();
  TextEditingController createdAtEditingController = TextEditingController();
  TextEditingController updatedAtEditingController = TextEditingController();

  RxBool isOrderLoading = false.obs;
  RxBool isGetUserLoading = false.obs;
  RxBool isDeleteUserLoading = false.obs;
  RxBool isUpdateUserLoading = false.obs;

  String customerCompany = '';


  RxList<dynamic> userList = <dynamic>[].obs;
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

  // Future<void> addUser() async {
  //   Map<String, dynamic> body = {
  //     "name": userNameTextEditingController.text,
  //     "contact_no": contactNoTextEditingController.text,
  //     "address": addressTextEditingController.text,
  //     "user_type": userRoleTextEditingController.text,
  //     "fingerprint": fingerprintEditingController,
  //   };
  //   try {
  //     String url = "${baseURL}user/insert";
  //     log("API => $url");
  //     isUserLoading.value = true;
  //     var response = await http.post(Uri.parse(url), body: body);
  //     if (response.statusCode == 200) {
  //       jsonDecode(response.body);
  //       Get.back();
  //       getUser();
  //
  //       isUserLoading.value = false;
  //     } else {
  //       debugPrint("statusCode${response.statusCode}");
  //       isUserLoading.value = false;
  //     }
  //   } catch (e) {
  //     debugPrint("Error${e.toString()}");
  //     isUserLoading.value = false;
  //   }
  // }

  Future<void> addOrder() async {
    Map<String, dynamic> body = {
      "user_id": modelUser.value.id,
      "customer_company_id": customerCompanyIdNoTextEditingController.text,
      "machine_ids": machineIdsTextEditingController.text,
      "delivery_date": deliveryDateTextEditingController.text,
      "total_payment": totalPaymentEditingController.text,
      "advance_payment": advancePaymentEditingController.text,
      "assign_order_id": assignOrderIdEditingController.text,
      "created_at": createdAtEditingController.text,
      "updated_at": updatedAtEditingController.text,
    };
    try {
      String url = "${baseURL}order/create";
      log("API => $url");
      isOrderLoading.value = true;
      var response = await http.post(Uri.parse(url), body: body);
      if (response.statusCode == 200) {
        jsonDecode(response.body);
        getOrder();
        Get.back();
        isOrderLoading.value = false;
      } else {
        debugPrint("statusCode${response.statusCode}");
        isOrderLoading.value = false;
      }
    } catch (e) {
      debugPrint("Error${e.toString()}");
      isOrderLoading.value = false;
    }
  }

  Future getOrder() async {
    try {
      String url = "${baseURL}user/getAll";
      log("API => $url");
      isGetUserLoading.value = true;
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        isGetUserLoading.value = false;
        var responseData = jsonDecode(response.body);
        List jobData = responseData["data"];
        userList.value = jobData;
      } else {
        debugPrint("statusCode${response.statusCode}");
        isGetUserLoading.value = false;
      }
    } catch (e) {
      debugPrint("Errors:$e");
      isGetUserLoading.value = false;
    }
  }

  Future<void> updateUser(id) async {
    Map<String, dynamic> body = {
      // "name": userNameTextEditingController.text,
      // "contact_no": contactNoTextEditingController.text,
      // "address": addressTextEditingController.text,
      // "user_type": userRoleTextEditingController.text,
      // "fingerprint": fingerprintEditingController,
    };
    try {
      String url = "${baseURL}user/update";
      log("API => $url");
      isUpdateUserLoading.value = true;
      var response = await http.post(Uri.parse(url), body: body);
      if (response.statusCode == 200) {
        jsonDecode(response.body);
        Get.back();
        getOrder();
        isUpdateUserLoading.value = false;
      } else {
        debugPrint("statusCode${response.statusCode}");
        isUpdateUserLoading.value = false;
      }
    } catch (e) {
      debugPrint("Error${e.toString()}");
      isUpdateUserLoading.value = false;
    }
  }

  Future<void> deleteUser(id) async {
    try {
      String url = "${baseURL}user/delete";
      log("API => $url");

      isDeleteUserLoading.value = true;
      var response = await http.post(Uri.parse(url), body: {"id": id});
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        isDeleteUserLoading.value = false;
        if (responseData["status"] == 1) {
          showToast(responseData["message"]);
          isDeleteUserLoading.value = false;
        } else {
          showToast(responseData["message"]);
          isDeleteUserLoading.value = false;
        }
      } else {
        debugPrint("statusCode===>${response.statusCode}");
        isDeleteUserLoading.value = false;
      }
    } catch (e) {
      debugPrint("Error:${e.toString()}");
      isDeleteUserLoading.value = false;
    }
  }
}
