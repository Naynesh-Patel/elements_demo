import 'dart:convert';
import 'dart:developer';

import 'package:elements/constant/urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SparepartsController extends GetxController {

  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController qtyTypeTextEditingController = TextEditingController();
  // TextEditingController newQtyTypeTextEditingController = TextEditingController();


  Future<void> updateSpareparts()async {

    String url = '${baseURL}sparepart/insert';
    log("API => $url");

    Map<String, dynamic> body = {
      "name": nameTextEditingController.text,
      "qty": qtyTypeTextEditingController.text,
      // "id": userTypeTextEditingController.text,
    };

    var response = await http.post(Uri.parse(url),body: body);

    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      data = body;
    }

  }


}
