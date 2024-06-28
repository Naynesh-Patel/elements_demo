import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CommonDropdown extends StatefulWidget {
  final String hintText;
  String? value;
  final ValueSetter<String>? callback;
  final List<String> dropdownList;
  CommonDropdown(
      {super.key,
      required this.value,
      required this.dropdownList,
      required this.hintText,
      this.callback});

  @override
  State<CommonDropdown> createState() => _CommonDropdownState();
}

class _CommonDropdownState extends State<CommonDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      // padding: const EdgeInsets.symmetric(horizontal: 16),
      // margin: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(color: Theme.of(context).focusColor, width: 1)),
      child: ButtonTheme(
        alignedDropdown: true,
        minWidth: 150,
        child: DropdownButton<String>(
          isExpanded: true,
          elevation: 10,
          underline: const SizedBox.shrink(),
          focusColor: Colors.white,
          value: widget.value,
          dropdownColor: Colors.grey.shade50,
          icon: Image.asset(
            "assets/images/down.png",
            height: 24,
          ),
          hint: Text(widget.hintText),
          items: widget.dropdownList.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff555555)),
              ),
            );
          }).toList(),
          onChanged: (val) {
            setState(() {
              widget.value = val!;
              widget.callback!(val);
            });
          },
        ),
      ),
    );
  }
}
