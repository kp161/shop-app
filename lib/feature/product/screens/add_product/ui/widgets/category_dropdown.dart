import 'package:flutter/material.dart';
import 'package:shop_app/core/constant/app_color.dart';
import 'package:shop_app/feature/product/screens/add_product/ui/widgets/product_category.dart';

class CategoryDropdown extends StatelessWidget{
  final String? value;
  final ValueChanged<String?> onChanged;

  const CategoryDropdown({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: DropdownButtonFormField<String>(
        value: value,
        items: ProductCategory.items
            .map((cat) => DropdownMenuItem(
                  value: cat,
                  child: Text(cat),
                ))
            .toList(),
        onChanged: onChanged,
        validator: (v) => v == null ? 'Required' : null,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelText: 'Category',
          labelStyle: const TextStyle(color: AppColor.primaryColor),
          prefixIcon:
              const Icon(Icons.category_outlined, color: AppColor.primaryColor),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: AppColor.primaryColor, width: 1.5),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}