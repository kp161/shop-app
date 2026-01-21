import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/core/constant/app_color.dart';
import 'package:shop_app/core/di/injection.dart';
import 'package:shop_app/feature/product/screens/add_product/provider/add_product_provider.dart';
import 'package:shop_app/feature/product/screens/add_product/ui/widgets/category_dropdown.dart';
import 'package:shop_app/feature/product/screens/add_product/ui/widgets/image_picker.dart';
import 'package:shop_app/feature/product/screens/add_product/ui/widgets/product_text_field.dart';
import 'package:shop_app/feature/product/screens/add_product/ui/widgets/section_title.dart';
import 'package:shop_app/feature/product/screens/add_product/ui/widgets/submit_button.dart';
import 'package:shop_app/feature/product/screens/add_product/helper/submit_product.dart';

@RoutePage()
class AddProductScreen extends StatefulWidget implements AutoRouteWrapper {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AddProductProvider(sl()),
      child: this,
    );
  }
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();

  final _titleCtrl = TextEditingController();
  final _priceCtrl = TextEditingController();
  final _descriptionCtrl = TextEditingController();
  String? _selectedCategory;
  File? _image;

  void _resetForm() {
    _formKey.currentState!.reset();
    _titleCtrl.clear();
    _priceCtrl.clear();
    _descriptionCtrl.clear();
    setState(() {
      _image = null;
      _selectedCategory = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: const Text('Add Product'),
        backgroundColor: AppColor.bgColor,
        foregroundColor: AppColor.primaryColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(title: 'Product Image'),
              const SizedBox(height: 10),
              ProductImagePicker(
                image: _image,
                onImagePicked: (file) => setState(() => _image = file),
              ),
              const SizedBox(height: 25),
              const SectionTitle(title: 'Product Details'),
              const SizedBox(height: 15),
              ProductTextField(
                  controller: _titleCtrl, label: 'Title', icon: Icons.title),
              ProductTextField(
                  controller: _priceCtrl,
                  label: 'Price',
                  icon: Icons.currency_rupee,
                  isNumber: true),
              CategoryDropdown(
                  value: _selectedCategory,
                  onChanged: (v) => setState(() => _selectedCategory = v)),
              ProductTextField(
                  controller: _descriptionCtrl,
                  label: 'Description',
                  icon: Icons.description_outlined,
                  maxlines: 4),
              const SizedBox(height: 30),
              Selector<AddProductProvider, bool>(
                selector: (_, provider) => provider.isLoading,
                builder: (context, isLoading, _) {
                  return SubmitButton(
                    isLoading: isLoading,
                    onPressed: () => submitProduct(
                        context: context,
                        formKey: _formKey,
                        titleCtrl: _titleCtrl,
                        descriptionCtrl: _descriptionCtrl,
                        priceCtrl: _priceCtrl,
                        image: _image,
                        category: _selectedCategory,
                        onSuccess: _resetForm),
                  );
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
