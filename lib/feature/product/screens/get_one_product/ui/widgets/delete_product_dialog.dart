import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/core/di/injection.dart';
import 'package:shop_app/feature/product/screens/delete_product/provider/delete_product_provider.dart';

Future<bool?> showDeleteProductDialog({
  required BuildContext context,
  required int productId,
}) {
  return showDialog<bool>(
    context: context,
    barrierDismissible: false,
    useRootNavigator: true,
    builder: (dialogContext) {
      return ChangeNotifierProvider(
        create: (_) => DeleteProductProvider(sl()),
        child: Consumer<DeleteProductProvider>(
          builder: (context, provider, _) {
            return AlertDialog(
              title: const Text(
                'Delete Product',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              content: const Text(
                  'Are you sure you want to delete this product? This action cannot be undone.'),
              actions: [
                TextButton(
                  onPressed: provider.isLoading
                      ? null
                      : () => Navigator.of(dialogContext).pop(false),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    disabledBackgroundColor: Colors.redAccent,
                    disabledForegroundColor: Colors.white,
                  ),
                  onPressed: provider.isLoading
                      ? null
                      : () async {
                          final success = await provider.deleteProductProvider(
                              id: productId);
                          if (dialogContext.mounted) {
                            Navigator.of(dialogContext).pop(success);
                          }
                        },
                  child: provider.isLoading
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Text(
                          'Delete',
                          style: TextStyle(color: Colors.white),
                        ),
                ),
              ],
            );
          },
        ),
      );
    },
  );
}
