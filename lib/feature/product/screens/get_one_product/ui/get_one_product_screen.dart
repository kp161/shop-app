import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/core/constant/app_color.dart';
import 'package:shop_app/core/di/injection.dart';
import 'package:shop_app/core/utils/dimensions.dart';
import 'package:shop_app/feature/product/screens/delete_product/provider/delete_product_provider.dart';
import 'package:shop_app/feature/product/screens/get_one_product/provider/get_one_product_provider.dart';
import 'package:shop_app/feature/product/screens/get_one_product/ui/widgets/product_detail_actions.dart';

@RoutePage()
class GetOneProductScreen extends StatelessWidget implements AutoRouteWrapper {
  final int id;
  const GetOneProductScreen({super.key, required this.id});

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => GetOneProductProvider(sl())..getProductById(id: id)),
        ChangeNotifierProvider(create: (_) => DeleteProductProvider(sl()))
      ],
      child: _GetOneProductView(id: id),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}


class _GetOneProductView extends StatelessWidget{
  final int id;
  const _GetOneProductView({required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: AppBar(
        backgroundColor: AppColor.bgColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              if (context.router.canPop()) {
                context.router.pop();
              }
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 22,
            )),
        title: const Text(
          'Product details',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        actions: [ProductDetailActions(productId: id)],
      ),
      body: Consumer<GetOneProductProvider>(builder: (context, provider, _) {
        if (provider.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (provider.error != null) {
          return Center(
            child: Text(
              provider.error!,
              style: const TextStyle(color: AppColor.errorColor),
            ),
          );
        }

        final product = provider.product;
        if (product == null) {
          return const Center(child: Text('Product not found'));
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Image.network(
                    product.image ?? '',
                    height: 250,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => const Icon(
                      Icons.image_not_supported,
                      size: 60,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                product.title ?? '',
                style: const TextStyle(
                  fontSize: Dimensions.fontSize22,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primaryColor,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "₹ ${product.price ?? 0}",
                    style: const TextStyle(
                      fontSize: Dimensions.fontSize22,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (product.rating != null)
                    Row(
                      children: [
                        const Icon(Icons.star, size: 18, color: Colors.orange),
                        const SizedBox(width: 4),
                        Text(
                          '${product.rating!.rate} (${product.rating!.count})',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
              const SizedBox(height: 18),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColor.secondaryColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  product.category ?? '',
                  style: const TextStyle(
                    color: AppColor.secondaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Description',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      product.description ?? '',
                      style: TextStyle(
                        color: Colors.grey[700],
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}