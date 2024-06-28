import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class ModelMachinery {
  final TextEditingController? qtyController;
  RxBool isSelected;

  ModelMachinery({this.qtyController, required this.isSelected});
}
