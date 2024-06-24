import 'package:elements/model/model_machinery.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MachineryController extends GetxController {
  RxList<ModelMachinery> machineryList = <ModelMachinery>[].obs;

  TextEditingController qtyTextEditingController = TextEditingController();
}
