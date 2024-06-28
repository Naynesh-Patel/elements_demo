import 'dart:convert';
import 'dart:developer';

import 'package:elements/constant/urls.dart';
import 'package:elements/dashboard.dart';
import 'package:elements/model/model_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  TextEditingController mobileNumberTextEditingController =
      TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController userTypeTextEditingController = TextEditingController();

  bool loginPasswordVisible = true;

  final box = GetStorage();

  Rx<ModelUser> modelUser = ModelUser().obs;

  FocusNode focusNode = FocusNode();

  /* ========== Focus Nodes =========== */
  FocusNode mobileFocusNode = FocusNode();

  FocusNode passwordFocusNode = FocusNode();

  RxBool isLoginLoading = false.obs;

  Future<void> login() async {
    Map<String, dynamic> body = {
      "password": passwordTextEditingController.text,
      "contact_no": mobileNumberTextEditingController.text,
      "user_type": userTypeTextEditingController.text,
    };
    try {
      String url = "${baseURL}user/login";
      log("API => $url");
      isLoginLoading.value = true;
      var response = await http.post(Uri.parse(url), body: body);
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        jsonDecode(response.body);
        if (responseData['status'] == 0) {
          modelUser.value = ModelUser.fromJson(responseData['user']);
        } else {
          box.write("user", responseData);
          box.write("isLogin", true);
          Get.off(() => const DashBoard());
        }
        isLoginLoading.value = false;
      } else {
        debugPrint("statusCode${response.statusCode}");
        isLoginLoading.value = false;
      }
    } catch (e) {
      debugPrint("Error${e.toString()}");
      isLoginLoading.value = false;
    }
  }
}
