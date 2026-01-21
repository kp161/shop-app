import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/core/routes/app_router.dart';
import 'package:shop_app/feature/product/model/get_all_product_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:shop_app/feature/product/screens/get_all_products/provider/get_all_product_provider.dart';

class ProductCard extends StatelessWidget {
  final GetAllProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (product.id != null) {
          final result = await context.router.push(
            GetOneProductRoute(id: product.id!),
          );
          if (result == true) {
            context.read<GetAllProductProvider>().getAllProducts();
          }
        }
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(14)),
                child: Image.network(
                  product.image ?? '',
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) =>
                      const Icon(Icons.image_not_supported),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
              child: Column(
                children: [
                  Text(
                    product.title ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "₹ ${product.price ?? 0}",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
