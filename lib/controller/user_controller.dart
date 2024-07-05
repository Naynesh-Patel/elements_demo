import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../constant/methods.dart';
import '../constant/urls.dart';

class UserController extends GetxController {
  TextEditingController userNameTextEditingController = TextEditingController();
  TextEditingController addressTextEditingController = TextEditingController();
  TextEditingController userRoleTextEditingController = TextEditingController();
  TextEditingController contactNoTextEditingController = TextEditingController();

  TextEditingController fingerprintEditingController = TextEditingController();

  RxBool isUserLoading = false.obs;
  RxBool isGetUserLoading = false.obs;
  RxBool isDeleteUserLoading = false.obs;
  RxBool isUpdateUserLoading = false.obs;

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

  Future<void> addUser() async {
    Map<String, dynamic> body = {
      "name": userNameTextEditingController.text,
      "contact_no": contactNoTextEditingController.text,
      "address": addressTextEditingController.text,
      "user_type": userRoleTextEditingController.text,
      "fingerprint": fingerprintEditingController.text,
    };
    try {
      String url = "${baseURL}user/insert";
      log("API => $url");
      isUserLoading.value = true;
      var response = await http.post(Uri.parse(url), body: body);
      if (response.statusCode == 200) {
        jsonDecode(response.body);
        getUser();
        Get.back();
        isUserLoading.value = false;
      } else {
        debugPrint("statusCode${response.statusCode}");
        isUserLoading.value = false;
      }
    } catch (e) {
      debugPrint("Error${e.toString()}");
      isUserLoading.value = false;
    }
  }

  Future getUser() async {
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
      "name": userNameTextEditingController.text,
      "contact_no": contactNoTextEditingController.text,
      "address": addressTextEditingController.text,
      "user_type": userRoleTextEditingController.text,
      "fingerprint": fingerprintEditingController.text,
    };
    try {
      String url = "${baseURL}user/update";
      log("API => $url");
      isUpdateUserLoading.value = true;
      var response = await http.post(Uri.parse(url), body: body);
      if (response.statusCode == 200) {
        jsonDecode(response.body);
        Get.back();
        getUser();
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
