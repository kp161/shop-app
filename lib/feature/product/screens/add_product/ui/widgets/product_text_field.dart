import 'package:flutter/material.dart';
import 'package:shop_app/core/constant/app_color.dart';
import 'package:shop_app/widgets/text_field.dart';

class ProductTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final bool isNumber;
  final int maxlines;

  const ProductTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
    this.isNumber = false,
    this.maxlines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: CustomeTextField(
        controller: controller,
        hintText: label,
        keyboardType: isNumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        focusedBorderColor: AppColor.primaryColor,
        enabledBorderColor: Colors.transparent,
        disabledBorderColor: Colors.transparent,
        borderWidth: 0,
        borderRadius: BorderRadius.circular(12),
        maxlines: maxlines,
        validator: (v) =>
            v == null || v.isEmpty ? 'This field is required' : null,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        fillColor: Colors.white,
        labelText: label,
        labelStyle: const TextStyle(color: AppColor.primaryColor),
        prefixIcon: Icon(
          icon,
          color: AppColor.primaryColor,
        ),
      ),
    );
  }
}
