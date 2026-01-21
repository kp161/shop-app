import 'package:flutter/material.dart';
import 'package:shop_app/core/constant/app_color.dart';
import 'package:shop_app/widgets/text_field.dart';

class UpdateProductForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController titleController;
  final TextEditingController priceController;
  final TextEditingController descriptionController;
  final TextEditingController categoryController;

  const UpdateProductForm({
    super.key,
    required this.formKey,
    required this.titleController,
    required this.priceController,
    required this.descriptionController,
    required this.categoryController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTextField('Title', titleController,
            validator: (value) =>
                value!.isEmpty ? 'Title is required' : null),
        _buildTextField('Price', priceController,
            keyboardType: TextInputType.number, validator: (value) {
          if (value!.isEmpty) return 'Price is required';
          if (double.tryParse(value) == null) {
            return 'Enter valid price';
          }
          return null;
        }),
        _buildTextField('Category', categoryController,
            validator: (value) =>
                value!.isEmpty ? 'Category is required' : null),
        _buildTextField('Description', descriptionController,
            maxLines: 4,
            validator: (value) =>
                value!.isEmpty ? 'Description is required' : null),
      ],
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          CustomeTextField(
            controller: controller,
            keyboardType: keyboardType,
            maxlines: maxLines,
            validator: validator,
            hintText: label,
            focusedBorderColor: AppColor.primaryColor,
            enabledBorderColor: Colors.transparent,
            disabledBorderColor: Colors.transparent,
            borderWidth: 0.1,
            borderRadius: BorderRadius.circular(12),
          ),
        ],
      ),
    );
  }
}
