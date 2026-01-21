import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/core/utils/show_snackbar.dart';
import 'package:shop_app/feature/product/screens/add_product/provider/add_product_provider.dart';

Future<void> submitProduct({
  required BuildContext context,
  required GlobalKey<FormState> formKey,
  required TextEditingController titleCtrl,
  required TextEditingController descriptionCtrl,
  required TextEditingController priceCtrl,
  required File? image,
  required String? category,
  required VoidCallback onSuccess,
}) async {
  if (!formKey.currentState!.validate()) return;
  if (image == null) {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Please Select an Image')));
    return;
  }

  if (category == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Please Select a Category')),
    );
    return;
  }

  final provider = context.read<AddProductProvider>();

  final success = await provider.addProductProvider(
    title: titleCtrl.text.trim(),
    description: descriptionCtrl.text.trim(),
    category: category,
    image: image,
    price: double.parse(priceCtrl.text),
  );

  if (success) {
    showFlushbar(
        context: context,
        message: 'Product Added successfully.',
        isError: false);
    onSuccess();
  } else {
    showFlushbar(context: context, message: 'Failed to add product.');
  }
}
