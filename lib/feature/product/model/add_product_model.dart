// To parse this JSON data, do
//
//     final addProductModel = addProductModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'add_product_model.freezed.dart';
part 'add_product_model.g.dart';

AddProductModel addProductModelFromJson(String str) => AddProductModel.fromJson(json.decode(str));

String addProductModelToJson(AddProductModel data) => json.encode(data.toJson());

@freezed
abstract class AddProductModel with _$AddProductModel {
    const factory AddProductModel({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "title")
        String? title,
        @JsonKey(name: "price")
        double? price,
        @JsonKey(name: "description")
        String? description,
        @JsonKey(name: "image")
        String? image,
        @JsonKey(name: "category")
        String? category,
    }) = _AddProductModel;

    factory AddProductModel.fromJson(Map<String, dynamic> json) => _$AddProductModelFromJson(json);
}
