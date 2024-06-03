import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final String? hintText;
  final String? labelText;
  final String? initialValue;
  final TextInputType? textInputType;
  final Widget? preFixWidget;
  final BoxConstraints? prefixIconConstraints;
  final Widget? suffixFixWidget;
  final int? maxLength;
  final bool? readOnly;
  final bool? enable;
  final bool? autofocus;
  final Function()? onTap;
  final Function(String)? onChange;
  final double? paddingHorizontal;
  final TextStyle? style;
  final int? maxLines;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode? autoValidateMode;
  final String? errorText;
  final Function(String)? onFieldSubmitted;
  final Function(String?)? onSaved;

  const CustomTextField({
    super.key,
    this.textEditingController,
    this.focusNode,
    this.hintText,
    this.initialValue,
    this.textInputType,
    this.suffixFixWidget,
    this.preFixWidget,
    this.prefixIconConstraints,
    this.maxLength,
    this.readOnly,
    this.enable,
    this.autofocus,
    this.onTap,
    this.onChange,
    this.paddingHorizontal,
    this.style,
    this.maxLines,
    this.validator,
    this.autoValidateMode,
    this.inputFormatters,
    this.errorText,
    this.onFieldSubmitted,
    this.onSaved,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      focusNode: focusNode,
      keyboardType: textInputType ?? TextInputType.text,
      showCursor: true,
      enabled: enable ?? true,
      readOnly: readOnly ?? false,
      cursorColor: Colors.black,
      maxLength: maxLength,
      onChanged: onChange,
      autofocus: autofocus ?? false,
      style: style ??
          AppTextStyle.textStyleRegular16
              .copyWith(letterSpacing: maxLength == 10 ? 2.0 : 1.0),
      maxLines: maxLines ?? 1,
      textAlign: TextAlign.start,
      initialValue: initialValue,
      decoration: InputDecoration(
          errorText: errorText,
          fillColor: Colors.white,
          errorStyle: const TextStyle(color: Colors.red),
          prefixIcon: preFixWidget,
          suffixIcon: suffixFixWidget ?? const SizedBox.shrink(),
          // prefixIconConstraints: prefixIconConstraints ??
          //     const BoxConstraints(maxWidth: 16, minWidth: 10),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: AppColor.hintColor, width: 0.0),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: AppColor.hintColor, width: 0.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: Colors.red, width: 0.0),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: Colors.red, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: AppColor.hintColor, width: 0.0),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          hintText: hintText,
          labelStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xff555555)),
          hintStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: Color(0xffD1D1D1)),
          counterText: "",
          labelText: labelText),
      onFieldSubmitted: onFieldSubmitted,
      inputFormatters: inputFormatters,
      onSaved: onSaved,
      onTap: onTap,
      validator: validator,
      autovalidateMode: autoValidateMode,
    );
  }
}
