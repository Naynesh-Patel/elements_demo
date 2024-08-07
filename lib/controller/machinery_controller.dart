import 'dart:convert';
import 'dart:developer';

import 'package:elements/constant/methods.dart';
import 'package:elements/constant/urls.dart';
import 'package:elements/controller/spareparts_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MachineryController extends GetxController {
  // RxList<ModelMachinery> machineryList = <ModelMachinery>[].obs;

  RxList<dynamic> addMachineryList = <dynamic>[].obs;
  TextEditingController qtyTextEditingController = TextEditingController();
  TextEditingController machineNameTextEditingController =
      TextEditingController();
  TextEditingController machinetypeEditingController = TextEditingController();
  TextEditingController manufactureDurationTextEditingController =
      TextEditingController();

  TextEditingController sparepartsTextEditingController =
      TextEditingController();

  RxList<dynamic> selectMachineList = <dynamic>[].obs;

  RxBool isMachineryLoading = false.obs;
  RxBool isGetMachineryLoading = false.obs;
  RxBool isDeleteMachineryLoading = false.obs;
  RxBool isUpdateMachineryLoading = false.obs;

  FocusNode sparepartsNameFocusNode = FocusNode();
  FocusNode sparepartsQtyFocusNode = FocusNode();
  FocusNode sparepartsNewQtyFocusNode = FocusNode();

  RxBool isSelect = true.obs;

  Future<void> addMachinery() async {
    SparepartsController sparepartsController = Get.find();
    List<dynamic> spareparts = [];
    for (int i = 0; i < sparepartsController.selectSparepartsList.length; i++) {
      Map<String, dynamic> d = {
        'id': sparepartsController.selectSparepartsList[i]['id'],
        'name': sparepartsController.selectSparepartsList[i]['name'],
        'qty': sparepartsController.selectSparepartsList[i]['controller'].text,
      };
      spareparts.add(d);
    }

    Map<String, dynamic> body = {
      // "id": modelUser.value.id,
      "machine_name": machineNameTextEditingController.text,
      // "qty": qtyTextEditingController.text,
      "machine_type": machinetypeEditingController.text,
      "manufacture_duration": manufactureDurationTextEditingController.text,
      // "spareparts": spareparts.toString(),
      "spareparts": jsonEncode(spareparts),
    };

    try {
      String url = "${baseURL}machine/add";
      log("API => $url");
      isMachineryLoading.value = true;
      var response = await http.post(Uri.parse(url), body: body);
      if (response.statusCode == 200) {
        jsonDecode(response.body);
        getMachinery();
        Get.back();
        isMachineryLoading.value = false;
      } else {
        debugPrint("statusCode${response.statusCode}");
        isMachineryLoading.value = false;
      }
    } catch (e) {
      debugPrint("Error${e.toString()}");
      isMachineryLoading.value = false;
    }
  }

  Future<void> getMachinery({bool isMultiSelection = false}) async {
    try {
      String url = "${baseURL}machine/getAll";
      log("API => $url");
      isGetMachineryLoading.value = true;
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        isGetMachineryLoading.value = false;
        var responseData = jsonDecode(response.body);
        List jobData = responseData["data"];
        addMachineryList.value = jobData;
        if(isMultiSelection){
          containValueIsExitOrNot();
        }
      } else {
        debugPrint("statusCode${response.statusCode}");
        isGetMachineryLoading.value = false;
      }
    } catch (e) {
      debugPrint("Errors:$e");
      isGetMachineryLoading.value = false;
    }
  }

  Future<void> updateMachinery(id) async {
    SparepartsController sparepartsController = Get.find();
    List<dynamic> spareparts = [];
    for (int i = 0; i < sparepartsController.selectSparepartsList.length; i++) {
      Map<String, dynamic> d = {
        'id': sparepartsController.selectSparepartsList[i]['id'],
        'name': sparepartsController.selectSparepartsList[i]['name'],
        'qty': sparepartsController.selectSparepartsList[i]['controller'].text,
      };
      spareparts.add(d);
    }

    Map<String, dynamic> body = {
      "id": id,
      "machine_name": machineNameTextEditingController.text,
      // "qty": qtyTextEditingController.text,
      "machine_type": machinetypeEditingController.text,
      "manufacture_duration": manufactureDurationTextEditingController.text,
      "spareparts": jsonEncode(spareparts),
    };
    try {
      String url = "${baseURL}machine/update";
      log("API => $url");
      isMachineryLoading.value = true;
      var response = await http.post(Uri.parse(url), body: body);
      if (response.statusCode == 200) {
        jsonDecode(response.body);
        Get.back();
        getMachinery();
        isMachineryLoading.value = false;
      } else {
        debugPrint("statusCode${response.statusCode}");
        isMachineryLoading.value = false;
      }
    } catch (e) {
      debugPrint("Error${e.toString()}");
      isMachineryLoading.value = false;
    }
  }

  Future<void> deleteMachinery(id) async {
    try {
      String url = "${baseURL}machine/delete";
      log("API => $url");

      isDeleteMachineryLoading.value = true;
      var response = await http.post(Uri.parse(url), body: {"id": id});
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        isDeleteMachineryLoading.value = false;
        if (responseData["status"] == 1) {
          showToast(responseData["message"]);
          isDeleteMachineryLoading.value = false;
        } else {
          showToast(responseData["message"]);
          isDeleteMachineryLoading.value = false;
        }
      } else {
        debugPrint("statusCode===>${response.statusCode}");
        isDeleteMachineryLoading.value = false;
      }
    } catch (e) {
      debugPrint("Error:${e.toString()}");
      isDeleteMachineryLoading.value = false;
    }
  }

  containValueIsExitOrNot(){
    for(int i =0; i< selectMachineList.length;i++){
      int index = addMachineryList.indexWhere((item) => item["id"] == selectMachineList[i]['id']);
      if(index != -1){
        addMachineryList[index]['isSelect'] = true;
      }
    }

  }
}
