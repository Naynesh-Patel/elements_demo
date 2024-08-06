import 'dart:convert';
import 'dart:developer';

import 'package:elements/constant/methods.dart';
import 'package:elements/constant/urls.dart';
import 'package:elements/constant/vars.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SparepartsController extends GetxController {
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController qtyTypeTextEditingController = TextEditingController();
  TextEditingController descriptionTextEditingController = TextEditingController();
  TextEditingController newqtyTypeTextEditingController = TextEditingController();
  TextEditingController sparepartsTextEditingController = TextEditingController();
  TextEditingController totalQtyTextEditingController = TextEditingController();

  RxBool isSparepartsLoading = false.obs;
  RxBool isGetSparepartsLoading = false.obs;
  RxBool isDeleteSparepartsLoading = false.obs;
  RxBool isUpdateSparepartsLoading = false.obs;

  RxBool isLoading = false.obs;

  FocusNode sparepartsNameFocusNode = FocusNode();
  FocusNode sparepartsQtyFocusNode = FocusNode();
  FocusNode sparepartsNewQtyFocusNode = FocusNode();

  RxList<dynamic> sparepartsList = <dynamic>[].obs;
  RxList<dynamic> historyList = <dynamic>[].obs;
  RxList<dynamic> selectSparepartsList = <dynamic>[].obs;

  DateTime? startDate;
  DateTime? endDate;




  RxBool isSelect = true.obs;


  TextEditingController startTextEditingController = TextEditingController(
      text: getDateInDDMMMYY(DateTime.parse(DateTime.now().add(const Duration(days: 1)).toString())).toString());
  TextEditingController endTextEditingController = TextEditingController();

  // TextEditingController newQtyTypeTextEditingController = TextEditingController();

  // Future<void> addSpareparts() async {
  //   String url = '${baseURL}sparepart/insert';
  //   log("API => $url");
  //
  //   Map<String, dynamic> body = {
  //     "name": nameTextEditingController.text,
  //     "qty": qtyTypeTextEditingController.text,
  //     // "id": userTypeTextEditingController.text,
  //   };
  //
  //   var response = await http.post(Uri.parse(url), body: body);
  //
  //   if (response.statusCode == 200) {
  //     var data = jsonDecode(response.body);
  //     data = body;
  //   }
  // }

  Future<void> addSpareparts() async {
    Map<String, dynamic> body = {
      "name": nameTextEditingController.text,
      "qty": qtyTypeTextEditingController.text,
       "user_id": modelUser.value.id,
    };
    try {
      String url = "${baseURL}sparepart/insert";
      log("API => $url");
      isSparepartsLoading.value = true;
      var response = await http.post(Uri.parse(url), body: body);
      if (response.statusCode == 200) {
        jsonDecode(response.body);

        getSpareparts();
        Get.back();
        isSparepartsLoading.value = false;
      } else {
        debugPrint("statusCode${response.statusCode}");
        isSparepartsLoading.value = false;
      }
    } catch (e) {
      debugPrint("Error${e.toString()}");
      isSparepartsLoading.value = false;
    }
  }

  Future getSpareparts({bool isMultiSelection = false}) async {
    try {
      String url = "${baseURL}sparepart/getAll";
      log("API => $url");
      isGetSparepartsLoading.value = true;
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        isGetSparepartsLoading.value = false;
        var responseData = jsonDecode(response.body);
        List jobData = responseData["data"];
        sparepartsList.value = jobData;
        if(isMultiSelection){
          containValueIsExitOrNot();
        }
      } else {
        debugPrint("statusCode${response.statusCode}");
        isGetSparepartsLoading.value = false;
      }
    } catch (e) {
      debugPrint("Errors:$e");
      isGetSparepartsLoading.value = false;
    }
  }

  Future getHistory({required String sparepartId}) async {
    try {
      String url = "${baseURL}sparepart/getHistory?id=$sparepartId";
      log("API => $url");
      isLoading.value = true;
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        List h = responseData["data"];
        sparepartsList.value = h;
        isLoading.value = false;
      } else {
        debugPrint("statusCode${response.statusCode}");
        isLoading.value = false;
      }
    } catch (e) {
      debugPrint("Errors:$e");
      isLoading.value = false;
    }
  }

  Future<void> updateSpareparts(id) async {
    Map<String, dynamic> body = {
      "name": nameTextEditingController.text,
      "qty": totalQtyTextEditingController.text,
      "id": id,
    };
    try {
      String url = "${baseURL}sparepart/update";
      log("API => $url");
      isSparepartsLoading.value = true;
      var response = await http.post(Uri.parse(url), body: body);
      if (response.statusCode == 200) {
        jsonDecode(response.body);
        Get.back();
        getSpareparts();
        isSparepartsLoading.value = false;
      } else {
        debugPrint("statusCode${response.statusCode}");
        isSparepartsLoading.value = false;
      }
    } catch (e) {
      debugPrint("Error${e.toString()}");
      isSparepartsLoading.value = false;
    }
  }

  Future<void> deleteSpareparts(id) async {
    try {
      String url = "${baseURL}sparepart/delete";
      log("API => $url");
      isDeleteSparepartsLoading.value = false;
      var response = await http.post(Uri.parse(url), body: {
        "id": id,
      });
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        isDeleteSparepartsLoading.value = false;
        if (responseData["status"]["success"] == 1) {
          showToast(responseData["message"]);
          isDeleteSparepartsLoading.value = false;
        }
      } else {
        debugPrint("Fail");
      }
    } catch (e) {
      debugPrint("Error:$e");
      isDeleteSparepartsLoading.value = false;
    }
  }






  // Future<void> deleteSpareparts({required int index}) async {
  //   try {
  //     String url = "${baseURL}sparepart/delete";
  //     log("API => $url");
  //     isDeleteSparepartsLoading.value = true;
  //     var response = await http
  //         .post(Uri.parse(url), body: {'id': sparepartsList[index]['id']});
  //     if (response.statusCode == 200) {
  //       var responseData = jsonDecode(response.body);
  //       isDeleteSparepartsLoading.value = false;
  //       if (responseData["status"] == 1) {
  //         showToast(responseData["message"]);
  //         sparepartsList.removeAt(index);
  //         Get.back();
  //         isDeleteSparepartsLoading.value = false;
  //       } else {
  //         showToast(responseData["message"]);
  //         isDeleteSparepartsLoading.value = false;
  //       }
  //     } else {
  //       debugPrint("statusCode===>${response.statusCode}");
  //       isDeleteSparepartsLoading.value = false;
  //     }
  //   } catch (e) {
  //     debugPrint("Error:${e.toString()}");
  //     isDeleteSparepartsLoading.value = false;
  //   }
  // }



  containValueIsExitOrNot(){
    for(int i =0; i< selectSparepartsList.length;i++){
      int index = sparepartsList.indexWhere((item) => item["id"] == selectSparepartsList[i]['id']);
      if(index != -1){
        sparepartsList[index]['isSelect'] = true;
      }
    }

  }

  selectSparepart(){
    List _sList = [];
    _sList.addAll(selectSparepartsList);
    selectSparepartsList.clear();
    for (int i = 0; i < sparepartsList.length; i++) {
      if (sparepartsList[i]['isSelect'] == true) {
        int index = _sList.indexWhere((item) => item["id"] == sparepartsList[i]['id']);
        Map<String, dynamic> d = {};
        if(index != -1){
           d = {
            'id': sparepartsList[i]['id'],
            'name': sparepartsList[i]['name'],
            'controller': TextEditingController(text: _sList[index]['controller'].text),
          };
        }else{
            d = {
            'id': sparepartsList[i]['id'],
            'name': sparepartsList[i]['name'],
            'controller': TextEditingController(),
          };
        }
        selectSparepartsList.add(d);
      }
    }
    Get.back();
  }



}
