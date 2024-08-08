import 'dart:convert';
import 'dart:developer';
import 'package:elements/constant/methods.dart';
import 'package:elements/constant/urls.dart';
import 'package:elements/constant/vars.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ExpenseController extends GetxController {
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController expenseTypeTextEditingController =  TextEditingController();
  TextEditingController priceTextEditingController = TextEditingController();
  TextEditingController userIdTextEditingController = TextEditingController();
  TextEditingController companyIdEditingController = TextEditingController();
  TextEditingController expenseTypeEditingController = TextEditingController();

  RxBool isExpenseLoading = false.obs;
  RxBool isExpenseTypeLoading = false.obs;
  RxBool isGetExpenseLoading = false.obs;
  RxBool isDeleteExpenseLoading = false.obs;
  RxBool isUpdateExpenseLoading = false.obs;

  RxList<dynamic> selectExpenseList = <dynamic>[].obs;

  RxList<dynamic> expenseList = <dynamic>[].obs;
  RxList<dynamic> expenseTypeList = <dynamic>[].obs;

  Future<void> addExpense() async {
    Map<String, dynamic> body = {
      // "name": nameTextEditingController.text,
      "expense_type": expenseTypeTextEditingController.text,
      "price": priceTextEditingController.text,
      "user_id": modelUser.value.id,
      "company_id": '2',
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
      String url = "${baseURL}expense/getAll?user_id=${modelUser.value.id}";
      log("API => $url");
      isGetExpenseLoading.value = true;
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        isGetExpenseLoading.value = false;
        var responseData = jsonDecode(response.body);
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


  Future<void> addExpenseType() async {
    Map<String, dynamic> body = {
      "expense_type": expenseTypeEditingController.text,
    };
    try {
      String url = "${baseURL}expense/addExpenseType";
      log("API => $url");
      isExpenseLoading.value = true;
      var response = await http.post(Uri.parse(url), body: body);
      if (response.statusCode == 200) {
        jsonDecode(response.body);
        getExpenseTypeList();
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

  Future getExpenseTypeList() async {
    try {
      String url = "${baseURL}expense/getExpenseTypes";
      log("API => $url");
      isExpenseTypeLoading.value = true;
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        isExpenseTypeLoading.value = false;
        var responseData = jsonDecode(response.body);
        List jobData = responseData["expense_types"];
        expenseTypeList.value = jobData;
      } else {
        debugPrint("statusCode${response.statusCode}");
        isExpenseTypeLoading.value = false;
      }
    } catch (e) {
      debugPrint("Errors:$e");
      isExpenseTypeLoading.value = false;
    }
  }

  Future<void> updateExpense(id) async {
    Map<String, dynamic> body = {
      'id': id,
      // "name": nameTextEditingController.text,
      "expense_type": expenseTypeTextEditingController.text,
      "price": priceTextEditingController.text,
      "user_id": modelUser.value.id,
      "company_id": '2',
    };
    try {
      String url = "${baseURL}expense/update";
      log("API => $url");
      isExpenseLoading.value = true;
      var response = await http.post(Uri.parse(url), body: body);
      if (response.statusCode == 200) {
        jsonDecode(response.body);
        Get.back();
        getExpense();
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

  Future<void> deleteExpense({required int index}) async {
    try {
      String url = "${baseURL}expense/delete";
      log("API => $url");

      isDeleteExpenseLoading.value = true;
      var response = await http
          .post(Uri.parse(url), body: {"id": expenseList[index]['id']});
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        isDeleteExpenseLoading.value = false;
        if (responseData["status"] == 1) {
          showToast(responseData["message"]);
          expenseList.removeAt(index);
          Get.back();
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


  selectExpense(){
    List _sList = [];
    _sList.addAll(selectExpenseList);
    // selectSparepartsList.clear();
    for (int i = 0; i < expenseTypeList.length; i++) {
      if (expenseTypeList[i]['isSelect'] == true) {
        int index = _sList.indexWhere((item) => item["id"] == expenseTypeList[i]['id']);
        Map<String, dynamic> d = {};
        if(index == -1){
          d = {
            'id': expenseTypeList[i]['id'],
            'name': expenseTypeList[i]['name'],
            'controller': TextEditingController(),
          };
          selectExpenseList.add(d);
        }/*else{
            d = {
            'id': sparepartsList[i]['id'],
            'name': sparepartsList[i]['name'],
            'controller': TextEditingController(),
          };
        }*/
      }else{
        int index = _sList.indexWhere((item) => item["id"] == expenseTypeList[i]['id']);
        if(index != -1){
          selectExpenseList.removeAt(index);
        }
      }
    }
    Get.back();
  }
}
