// To parse this JSON data, do
//
//     final updateProductModel = updateProductModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'update_product_model.freezed.dart';
part 'update_product_model.g.dart';

UpdateProductModel updateProductModelFromJson(String str) => UpdateProductModel.fromJson(json.decode(str));

String updateProductModelToJson(UpdateProductModel data) => json.encode(data.toJson());

@freezed
abstract class UpdateProductModel with _$UpdateProductModel {
    const factory UpdateProductModel({
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
    }) = _UpdateProductModel;

    factory UpdateProductModel.fromJson(Map<String, dynamic> json) => _$UpdateProductModelFromJson(json);
}
