import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/core/constant/app_color.dart';
import 'package:shop_app/core/di/injection.dart';
import 'package:shop_app/feature/product/model/get_one_product_model.dart';
import 'package:shop_app/feature/product/screens/update_product/provider/update_product_provider.dart';
import 'package:shop_app/feature/product/screens/update_product/ui/widgets/update_image.dart';
import 'package:shop_app/feature/product/screens/update_product/ui/widgets/update_product_button.dart';
import 'package:shop_app/feature/product/screens/update_product/ui/widgets/update_product_form.dart';

@RoutePage()
class UpdateProductScreen extends StatelessWidget implements AutoRouteWrapper {
  final GetOneProductModel product;
  const UpdateProductScreen({super.key, required this.product});

  @override
  Widget wrappedRoute(BuildContext context){
    return ChangeNotifierProvider(create: (_) => UpdateProductProvider(sl()), child: this,);
  }

  @override
  Widget build(BuildContext context) {
    // IMPORTANT: Remove the ValueKey from here. 
    // AutoRouter handles the keys for pages internally.
    return  _UpdateProductContent(product: product);
  }
}

class _UpdateProductContent extends StatefulWidget{
  final GetOneProductModel product;
  const _UpdateProductContent({required this.product});

  @override
  State<_UpdateProductContent> createState() => _UpdateProductContentState();
}

class _UpdateProductContentState extends State<_UpdateProductContent> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _priceController;
  late TextEditingController _categoryController;
  late TextEditingController _descriptionController;
  File? _image;

 @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.product.title ?? '');
    _priceController = TextEditingController(text: widget.product.price?.toString() ?? '');
    _categoryController = TextEditingController(text: widget.product.category ?? '');
    _descriptionController = TextEditingController(text: widget.product.description ?? '');
  }

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    _categoryController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: AppBar(
        backgroundColor: AppColor.bgColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () => context.router.maybePop(),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        title:
            const Text('Update Product', style: TextStyle(color: Colors.black)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              UpdateImage(
                image: _image,
                networkImage: widget.product.image,
                onPickImage: (file) => setState(() => _image = file),
              ),
              const SizedBox(height: 24),
              UpdateProductForm(
                formKey: _formKey,
                titleController: _titleController,
                priceController: _priceController,
                descriptionController: _descriptionController,
                categoryController: _categoryController,
              ),
              const SizedBox(height: 24),
              UpdateProductButton(
                isNothingChanged: false,
                productId: widget.product.id!,
                product: widget.product,
                title: _titleController,
                price: _priceController,
                description: _descriptionController,
                category: _categoryController,
                image: _image,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
