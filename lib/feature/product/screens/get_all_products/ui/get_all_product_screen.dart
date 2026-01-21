import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/core/constant/app_color.dart';
import 'package:shop_app/core/di/injection.dart';
import 'package:shop_app/feature/product/screens/get_all_products/provider/get_all_product_provider.dart';
import 'package:shop_app/feature/product/screens/get_all_products/ui/widgets/product_card.dart';
import 'package:shop_app/feature/product/screens/get_all_products/ui/widgets/top_bar.dart';

@RoutePage()
class GetAllProductScreen extends StatelessWidget implements AutoRouteWrapper {
  const GetAllProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TopBar(),
          Expanded(
            child: Consumer<GetAllProductProvider>(
                builder: (context, provider, _) {
              if (provider.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (provider.products.isEmpty) {
                return const Center(
                  child: Text(
                    'No Products Found',
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.all(12),
                child: GridView.builder(
                    itemCount: provider.products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.70,
                    ),
                    itemBuilder: (context, index) {
                      return ProductCard(product: provider.products[index]);
                    }),
              );
            }),
          ),
        ],
      )),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GetAllProductProvider(sl())..getAllProducts(),
      child: this,
    );
  }
}
