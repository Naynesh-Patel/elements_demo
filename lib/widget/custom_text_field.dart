import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final String? hintText;
  final String? labelText;
  final Widget? label;
  final String? initialValue;
  final TextInputType? textInputType;
  final Widget? preFixWidget;
  final BoxConstraints? prefixIconConstraints;
  final Widget? suffixFixIcon;
  final Widget? suffix;
  final int? maxLength;
  final bool? readOnly;
  final bool? showCursor;

  final bool? obscureText;
  final bool? enable;
  final bool? autofocus;
  final bool? enableInteractiveSelection;
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
  final TextCapitalization textCapitalization;
  const CustomTextField(
      {super.key,
      this.textEditingController,
      this.focusNode,
      this.hintText,
      this.label,
      this.initialValue,
      this.textInputType,
      this.suffixFixIcon,
      this.suffix,
      this.preFixWidget,
      this.prefixIconConstraints,
      this.maxLength,
      this.readOnly,
      this.showCursor,
      this.enable,
      this.autofocus,
      this.enableInteractiveSelection,
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
      this.obscureText,
      this.textCapitalization = TextCapitalization.none});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String _lText = "";

  void _handleFocusChange() {
    if (mounted) {
      widget.textEditingController?.addListener(() {
        if (widget.textEditingController != null) {
          if (widget.textEditingController!.text.isNotEmpty) {
            _lText = widget.labelText!;
            setState(() {
              // Your state change code goes here
            });
          } else {
            _lText = "";
            setState(() {
              // Your state change code goes here
            });
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,
      focusNode: widget.focusNode,
      keyboardType: widget.textInputType ?? TextInputType.text,
      textCapitalization: widget.textCapitalization,
      showCursor: widget.showCursor ?? true,
      enabled: widget.enable ?? true,
      readOnly: widget.readOnly ?? false,
      cursorColor: Colors.black,
      maxLength: widget.maxLength,
      onChanged: widget.onChange,
      autofocus: widget.autofocus ?? false,
      enableInteractiveSelection: widget.enableInteractiveSelection ?? true,
      style: widget.style ??
          AppTextStyle.textStyleRegular14
              .copyWith(letterSpacing: widget.maxLength == 10 ? 2.0 : 1.0),
      maxLines: widget.maxLines ?? 1,
      textAlign: TextAlign.start,
      initialValue: widget.initialValue,
      obscureText: widget.obscureText ?? false,
      decoration: InputDecoration(
          errorText: widget.errorText,
          fillColor: Colors.white,
          errorStyle: const TextStyle(color: Colors.red,fontSize: 0.0),
          prefixIcon: widget.preFixWidget ?? null,
          suffixIcon: widget.suffixFixIcon,
          suffix: widget.suffix ?? const SizedBox.shrink(),
          // prefixIconConstraints: prefixIconConstraints ??
          //     const BoxConstraints(maxWidth: 16, minWidth: 10),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: AppColor.hintColor, width: 0.0),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: AppColor.hintColor, width: 0.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: Colors.red, width: 1.0),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: Colors.red, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: AppColor.hintColor, width: 0.0),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          hintText: widget.hintText,
          hintStyle: AppTextStyle.textStyleRegular13
              .copyWith(color: AppColor.dropDownHintColor),
          labelStyle: AppTextStyle.textStyleRegular16,
          counterText: "",
          label: widget.label,
          labelText: widget.labelText,
          // labelText: widget.focusNode!.hasFocus ? widget.labelText :"",
          floatingLabelBehavior: FloatingLabelBehavior.always),
      onFieldSubmitted: widget.onFieldSubmitted,
      inputFormatters: widget.inputFormatters,
      onSaved: widget.onSaved,
      onTap: widget.onTap,
      validator: widget.validator,
      autovalidateMode: widget.autoValidateMode,
    );
  }
}

/*class CustomTextField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final String? hintText;
  final String? labelText;
  final Widget? label;
  final String? initialValue;
  final TextInputType? textInputType;
  final Widget? preFixWidget;
  final BoxConstraints? prefixIconConstraints;
  final Widget? suffixFixWidget;
  final int? maxLength;
  final bool? readOnly;
  final bool? obscureText;
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
    this.label,
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
    this.obscureText,
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
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
          errorText: errorText,
          fillColor: Colors.white,
          errorStyle: const TextStyle(color: Colors.red),
          prefixIcon: preFixWidget,
          suffixIcon: suffixFixWidget ?? const SizedBox.shrink(),
          // prefixIconConstraints: prefixIconConstraints ??
          //     const BoxConstraints(maxWidth: 16, minWidth: 10),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: AppColor.hintColor, width: 0.0),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: AppColor.hintColor, width: 0.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: Colors.red, width: 0.0),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: Colors.red, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: AppColor.hintColor, width: 0.0),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          hintText: hintText,
          hintStyle: AppTextStyle.textStyleRegular14.copyWith(color: AppColor.dropDownHintColor),
          labelStyle:AppTextStyle.textStyleRegular16.copyWith(color: AppColor.blackColor),
          counterText: "",
          label: label,
          labelText: focusNode!.hasFocus ? labelText :"",
          floatingLabelBehavior: FloatingLabelBehavior.always
      ),
      onFieldSubmitted: onFieldSubmitted,
      inputFormatters: inputFormatters,
      onSaved: onSaved,
      onTap: onTap,
      validator: validator,
      autovalidateMode: autoValidateMode,
    );
  }
}*/
