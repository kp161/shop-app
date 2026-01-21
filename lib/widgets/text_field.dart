import 'package:flutter/material.dart';
import 'package:shop_app/core/constant/app_color.dart';

class CustomeTextField extends StatelessWidget{
  final TextEditingController controller;

  final String hintText;
  final String? labelText;
  final int? maxlines;

  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final TextStyle? labelStyle;

  final Color focusedBorderColor;
  final Color enabledBorderColor;
  final Color disabledBorderColor;
  final Color errorBorderColor;

  final double borderWidth;
  final BorderRadius borderRadius;

  final Color? fillColor;
  final Color? textColor;

  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final bool isObscure;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;

  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;

  const CustomeTextField({
    super.key,
    required this.controller,

    required this.hintText,
    this.labelText,

    this.hintStyle,
    this.textStyle,
    this.labelStyle,
    this.maxlines,

    this.isObscure = false,
    this.keyboardType,

    required this.focusedBorderColor,
    required this.enabledBorderColor,
    required this.disabledBorderColor,
    this.errorBorderColor = AppColor.errorColor,

    required this.borderWidth,
    required this.borderRadius,

    this.fillColor = Colors.white,
    this.textColor = Colors.black87,

    this.prefixIcon,
    this.suffixIcon,

    this.validator,
    this.autovalidateMode,

    this.onChanged,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder buildBorder(Color color){
      return OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(color: color, width: borderWidth)
      );
    }

    return TextFormField(
      controller: controller,
      maxLines: isObscure ? 1 : maxlines ?? 1,
      obscureText: isObscure,
      keyboardType: keyboardType,
      validator: validator,
      autovalidateMode: autovalidateMode,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      style: textStyle ?? TextStyle(
        color: textColor, fontSize: 15,
      ),

      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: labelStyle ?? TextStyle(color: Colors.grey.shade700),

        hintText: hintText,
        hintStyle: hintStyle ?? TextStyle(color: Colors.grey.shade500),

        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,

        filled: true,
        fillColor: fillColor,

        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),

        enabledBorder: buildBorder(enabledBorderColor),
        focusedBorder: buildBorder(focusedBorderColor),
        disabledBorder: buildBorder(disabledBorderColor.withOpacity(0.5)),

        errorBorder: buildBorder(errorBorderColor),
        focusedErrorBorder: buildBorder(errorBorderColor),
      ),
    );
  }
}