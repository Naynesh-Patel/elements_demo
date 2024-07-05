import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:elements/constant/vars.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../constant/methods.dart';
import '../constant/urls.dart';

class ExpenseController extends GetxController {
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController expenseTypeTextEditingController = TextEditingController();
  TextEditingController priceTextEditingController = TextEditingController();
  TextEditingController userIdTextEditingController = TextEditingController();
  TextEditingController companyIdEditingController = TextEditingController();

  RxBool isExpenseLoading = false.obs;
  RxBool isGetExpenseLoading = false.obs;
  RxBool isDeleteExpenseLoading = false.obs;
  RxBool isUpdateExpenseLoading = false.obs;

  RxList<dynamic> expenseList = <dynamic>[].obs;



  Future<void> addExpense() async {
    Map<String, dynamic> body = {
      "name": nameTextEditingController.text,
      "expense_type": expenseTypeTextEditingController.text,
      "price": priceTextEditingController.text,
      "user_id": modelUser.value.id,
      "company_id": '7',
    };
    try {
      String url = "${baseURL}expense/create";
      log("API => $url");
      isExpenseLoading.value = true;
      var response = await http.post(Uri.parse(url), body: body);
      if (response.statusCode == 200) {
        jsonDecode(response.body);
        getExpense();
        Get.back();
        isExpenseLoading.value = false;
      } else {
        debugPrint("statusCode${response.statusCode}");
        isExpenseLoading.value = false;
      }
    } catch (e) {
      debugPrint("Error${e.toString()}");
      isExpenseLoading.value = false;
    }
  }

  Future getExpense() async {
    try {
      String url = "${baseURL}expense/getAll";
      log("API => $url");
      isGetExpenseLoading.value = true;
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        isGetExpenseLoading.value = false;
        var responseData = jsonDecode(response.body);
        Get.back();
        getExpense();
        List jobData = responseData["expenses"];
        expenseList.value = jobData;
      } else {
        debugPrint("statusCode${response.statusCode}");
        isGetExpenseLoading.value = false;
      }
    } catch (e) {
      debugPrint("Errors:$e");
      isGetExpenseLoading.value = false;
    }
  }

  Future<void> updateExpense(id) async {
    Map<String, dynamic> body = {
      // "name": userNameTextEditingController.text,
      // "contact_no": contactNoTextEditingController.text,
      // "address": expenseTypeTextEditingController.text,
      // "user_type": userRoleTextEditingController.text,
      // "fingerprint": fingerprintEditingController,
    };
    try {
      String url = "${baseURL}user/update";
      log("API => $url");
      isUpdateExpenseLoading.value = true;
      var response = await http.post(Uri.parse(url), body: body);
      if (response.statusCode == 200) {
        jsonDecode(response.body);
        Get.back();
        getExpense();
        isUpdateExpenseLoading.value = false;
      } else {
        debugPrint("statusCode${response.statusCode}");
        isUpdateExpenseLoading.value = false;
      }
    } catch (e) {
      debugPrint("Error${e.toString()}");
      isUpdateExpenseLoading.value = false;
    }
  }

  Future<void> deleteExpense(id) async {
    try {
      String url = "${baseURL}user/delete";
      log("API => $url");

      isDeleteExpenseLoading.value = true;
      var response = await http.post(Uri.parse(url), body: {"id": id});
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        isDeleteExpenseLoading.value = false;
        if (responseData["status"] == 1) {
          showToast(responseData["message"]);
          isDeleteExpenseLoading.value = false;
        } else {
          showToast(responseData["message"]);
          isDeleteExpenseLoading.value = false;
        }
      } else {
        debugPrint("statusCode===>${response.statusCode}");
        isDeleteExpenseLoading.value = false;
      }
    } catch (e) {
      debugPrint("Error:${e.toString()}");
      isDeleteExpenseLoading.value = false;
    }
  }

}
