import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_app/core/constant/app_color.dart';

class ProductImagePicker extends StatelessWidget {
  final File? image;
  final ValueChanged<File> onImagePicked;

  const ProductImagePicker({
    super.key,
    required this.image,
    required this.onImagePicked,
  });

  Future<void> _pickImage(BuildContext context) async {
    final picked = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (picked != null) {
      onImagePicked(File(picked.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => _pickImage(context),
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            color: AppColor.primaryColor.withOpacity(0.02),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColor.primaryColor.withOpacity(0.5)),
            boxShadow: [
              BoxShadow(
                color: AppColor.primaryColor.withOpacity(0.04),
                blurRadius: 20,
                offset: const Offset(0, 10)
              )
            ]
          ),
          child: image == null
              ? Icon(Icons.add_a_photo_outlined, size: 50, color: AppColor.primaryColor.withOpacity(0.8),)
              : ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.file(image!, fit: BoxFit.cover),
                ),
        ),
      ),
    );
  }
}
