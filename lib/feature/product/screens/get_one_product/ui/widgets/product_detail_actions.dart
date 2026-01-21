import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/core/routes/app_router.dart';
import 'package:shop_app/core/utils/show_snackbar.dart';
import 'package:shop_app/feature/product/model/get_one_product_model.dart';
import 'package:shop_app/feature/product/screens/get_one_product/provider/get_one_product_provider.dart';
import 'package:shop_app/feature/product/screens/get_one_product/ui/widgets/delete_product_dialog.dart';

class ProductDetailActions extends StatelessWidget {
  final int productId;

  const ProductDetailActions({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Consumer<GetOneProductProvider>(builder: (context, provider, __) {
          if (provider.product == null) return const SizedBox();
          return IconButton(
              onPressed: () async {
                final product = provider.product;
                if (product != null) {
                  final result = await AutoRouter.of(context).push(UpdateProductRoute(product: product));

                  if(result != null && result is GetOneProductModel){
                    if(context.mounted){
                      context.read<GetOneProductProvider>().updateProductLocally(result);
                    }
                  }
                }
              },
              icon: const Icon(
                Icons.edit_outlined,
                color: Colors.black,
              ));
        }),
        IconButton(
          onPressed: () async {
            final success = await showDeleteProductDialog(
                context: context, productId: productId);

            if (!context.mounted) return;

            if (success == true) {
              showFlushbar(
                  context: context,
                  message: 'Product deleted successfully',
                  isError: false);
              Future.delayed(const Duration(seconds: 3), () {
                if (context.mounted) {
                  context.router.pop(true);
                }
              });
            } else if (success == false) {
              showFlushbar(
                  context: context,
                  message: 'Failed to Delete product',
                  isError: true);
            }
          },
          icon: const Icon(
            Icons.delete_outline,
            color: Colors.redAccent,
          ),
        ),
      ],
    );
  }
}
