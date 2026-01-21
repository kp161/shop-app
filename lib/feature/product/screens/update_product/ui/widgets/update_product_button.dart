import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/core/constant/app_color.dart';
import 'package:shop_app/core/utils/show_snackbar.dart';
import 'package:shop_app/feature/product/model/get_one_product_model.dart';
import 'package:shop_app/feature/product/screens/update_product/provider/update_product_provider.dart';

class UpdateProductButton extends StatelessWidget {
  final bool isNothingChanged;
  final int productId;
  final GetOneProductModel product;
  final TextEditingController title;
  final TextEditingController price;
  final TextEditingController description;
  final TextEditingController category;
  final File? image;

  const UpdateProductButton(
      {super.key,
      required this.isNothingChanged,
      required this.productId,
      required this.product,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Consumer<UpdateProductProvider>(builder: (context, provider, _) {
      return SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: () async {
            if (provider.isLoading) return;

            if (isNothingChanged) {
              showFlushbar(
                context: context,
                message: "No changes detected. Product is already up to date.",
                isError: false,
              );
              return;
            }

            final success = await provider.updateProductProvider(
                id: productId,
                title: title.text.trim(),
                description: description.text.trim(),
                category: category.text.trim(),
                price: double.parse(price.text.trim()),
                image: image);

            if (!context.mounted) return;

            if (success) {
              final updatedObject = GetOneProductModel(
                id: productId,
                title: title.text.trim(),
                price: double.parse(price.text.trim()),
                category: category.text.trim(),
                description: description.text.trim(),
                image: image != null ? image!.path : product.image,
                rating: product.rating,
              );

              context.router.pop(updatedObject);

              showFlushbar(
                  context: context,
                  message: "Product Updated Successfully",
                  isError: false);
            } else {
              showFlushbar(
                  context: context,
                  message: "Failed to Update Product",
                  isError: true);
            }
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primaryColor,
              disabledBackgroundColor: AppColor.primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          child: provider.isLoading
              ? const SizedBox(
                  height: 22,
                  width: 22,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: Colors.white,
                  ),
                )
              : const Text(
                  'Update Product',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColor.textColor),
                ),
        ),
      );
    });
  }
}
