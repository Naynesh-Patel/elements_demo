import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class ModelSpareparts {
  final TextEditingController? qtyController;
  RxBool isSelected;

  ModelSpareparts({this.qtyController, required this.isSelected});
}
