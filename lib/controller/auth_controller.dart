import 'dart:convert';
import 'dart:developer';

import 'package:elements/constant/vars.dart';
import 'package:elements/dashboard.dart';
import 'package:elements/widget/dialogs/custom_dialogbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../constant/methods.dart';
import '../constant/urls.dart';
import '../model/model_user.dart';

class AuthController extends GetxController {
  TextEditingController mobileNumberTextEditingController =
      TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController oldPasswordTextEditingController =
      TextEditingController();
  TextEditingController newPasswordTextEditingController =
      TextEditingController();
  TextEditingController confrimeTextEditingController = TextEditingController();
  TextEditingController userTypeTextEditingController = TextEditingController();

  bool loginPasswordVisible = true;
  bool changePasswordVisible = true;
  bool oldPasswordVisible = true;
  bool newPasswordVisible = true;

  RxBool isPasswordLoading = false.obs;

  final box = GetStorage();

  // Rx<ModelUser> modelUser = ModelUser().obs;

  FocusNode focusNode = FocusNode();

  /* ========== Focus Nodes =========== */
  FocusNode mobileFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode changePasswordNode = FocusNode();
  FocusNode oldPasswordNode = FocusNode();
  FocusNode newPasswordNode = FocusNode();

  RxBool isLoginLoading = false.obs;

  Future<void> changePassword({context}) async {
    Map<String, dynamic> body = {
      "user_id": modelUser.value.id,
      "old_password": oldPasswordTextEditingController.text,
      "new_password": newPasswordTextEditingController.text,
    };
    try {
      isPasswordLoading.value = true;
      String url = "${baseURL}user/changePassword";
      log("API => $url");
      isLoginLoading.value = true;
      var response = await http.post(Uri.parse(url), body: body);
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        box.write("user", responseData['user']);
        modelUser.value = ModelUser.fromJson(responseData['user']);
        CustomDialogBox.showPasswordReset(context: context);
      } else {
        debugPrint("Error");
        isPasswordLoading.value = false;
      }
    } catch (e) {
      isPasswordLoading.value = false;
    }
  }

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
        if (responseData['status'] == 1) {
          box.write('user', responseData['user']);
          box.write('isLogin', true);
          modelUser.value = ModelUser.fromJson(responseData['user']);
          Get.off(() => const DashBoard());
        } else {
          debugPrint('user not found');
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

  Future deleteAccount() async {
    try {
      String url = "${baseURL}user/delete_account";
      log("API => $url");

      var response = await http.post(Uri.parse(url), body: {
        "user_id": modelUser.value.id,
      });
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        if (responseData['status'] == 1) {
          showToast(responseData['message']);
        } else {
          showToast(responseData['message']);
        }
      } else {
        debugPrint("StatusCode=>${response.statusCode.toString()}");
      }
    } catch (e) {
      debugPrint("Error=>${e.toString()}");
    }
  }
}
