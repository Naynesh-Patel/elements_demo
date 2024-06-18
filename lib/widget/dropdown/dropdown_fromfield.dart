import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:flutter/material.dart';

class WidgetDropDownFromField extends StatelessWidget {
  final List<dynamic> itemList;
  final String hintText;
  final ValueSetter<dynamic> onTap;
  const WidgetDropDownFromField({Key? key,required this.itemList,required this.hintText,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<dynamic>(
      isExpanded: true,
      hint: Text(hintText,style: AppTextStyle.textStyleRegular14.copyWith(color: AppColor.dropDownHintColor),),
      decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.borderColor),
              borderRadius: BorderRadius.all(Radius.circular(6.0))
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.borderColor),
              borderRadius: BorderRadius.all(Radius.circular(6.0))
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.borderColor),
              borderRadius: BorderRadius.all(Radius.circular(6.0))
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 14.0),
        suffixIcon:  Icon(
          Icons.keyboard_arrow_down_outlined,
          color: AppColor.blackColor,
        ),
      ),
      items: itemList
          .map((item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      )).toList(),
      onChanged: (value) {
        onTap(value);
      },

      iconStyleData: const IconStyleData(
        icon: SizedBox.shrink(),
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),

    );
  }
}
