import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetDropDownFromField extends StatefulWidget {
  final List<dynamic> itemList;
  final String hintText;
  final String labelText;
  final String? errorMsg;
  final String value;
  final String? Function(dynamic)? validator;
  final ValueSetter<dynamic> onTap;
  final AutovalidateMode? autovalidateMode;
  final bool enable;

  const WidgetDropDownFromField({
    super.key,
    this.validator,
    required this.hintText,
    this.errorMsg,
    this.autovalidateMode,
    this.value = "",
    required this.onTap,
    required this.itemList,
    required this.labelText,
    this.enable = true,
  });

  @override
  State<WidgetDropDownFromField> createState() =>
      _WidgetDropDownFromFieldState();
}

class _WidgetDropDownFromFieldState extends State<WidgetDropDownFromField> {
  RxBool isValidate = false.obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        widget.enable
            ? Stack(
                children: <Widget>[
                  Container(
                    height: 60,
                    // color: Colors.red,
                  ),
                  Positioned(
                    bottom: 2.0,
                    right: 0,
                    left: 0,
                    child: Obx(() => Container(
                          width: Get.width,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            border: Border.all(
                                color: isValidate.value
                                    ? Colors.red
                                    : AppColor.borderColor),
                          ),
                          child: DropdownButtonFormField2<dynamic>(
                            // validator: validator,
                            validator: (value) {
                              if (value == null) {
                                isValidate.value = true;
                              } else {
                                isValidate.value = false;
                              }
                              return;
                            },
                            autovalidateMode: widget.autovalidateMode,
                            isExpanded: true,

                            hint: widget.value.isEmpty
                                ? Text(
                                    widget.hintText,
                                    style: AppTextStyle.textStyleRegular14
                                        .copyWith(
                                            color: AppColor.dropDownHintColor),
                                  )
                                : Text(
                                    widget.hintText,
                                    style: AppTextStyle.textStyleRegular16
                                        .copyWith(
                                            color: AppColor.dropDownHintColor),
                                  ),
                            value: widget.value.isEmpty ? null : widget.value,

                            decoration: const InputDecoration(
                              enabled: false,
                              enabledBorder: OutlineInputBorder(
                                  // borderSide: BorderSide(color: AppColor.borderColor),
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6.0))),
                              focusedBorder: OutlineInputBorder(
                                  // borderSide: BorderSide(color: AppColor.borderColor),
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6.0))),
                              border: OutlineInputBorder(
                                  // borderSide: BorderSide(color: AppColor.borderColor),
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6.0))),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 1.0),
                              suffixIcon: Icon(
                                Icons.keyboard_arrow_down_outlined,
                                color: AppColor.blackColor,
                              ),
                            ),
                            items: widget.itemList
                                .map((item) => DropdownMenuItem(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              widget.onTap(value);
                            },
                            iconStyleData: const IconStyleData(
                              icon: SizedBox.shrink(),
                            ),
                            dropdownStyleData: DropdownStyleData(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                        )),
                  ),
                  Positioned(
                    left: 16,
                    child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        color: Colors.white,
                        child: Text(
                          widget.labelText,
                          style: AppTextStyle.textStyleRegular13,
                        )),
                  )
                ],
              )
            : CustomTextField(
                textEditingController:
                    TextEditingController(text: widget.value),
                hintText: widget.hintText,
                labelText: widget.labelText,
                readOnly: true,
                showCursor: false,
                suffixFixIcon: const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  size: 24,
                ),
              ),
        Obx(() => isValidate.value ? errorText() : const SizedBox.shrink())
      ],
    );
  }

  Widget errorText() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 8.0,
          ),
          Text(
            widget.errorMsg ?? "Please Select User Role",
            style: AppTextStyle.textStyleLight12.copyWith(color: Colors.red),
          )
        ],
      ),
    );
  }
}
