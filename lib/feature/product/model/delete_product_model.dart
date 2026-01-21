// To parse this JSON data, do
//
//     final deleteProductModel = deleteProductModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'delete_product_model.freezed.dart';
part 'delete_product_model.g.dart';

DeleteProductModel deleteProductModelFromJson(String str) => DeleteProductModel.fromJson(json.decode(str));

String deleteProductModelToJson(DeleteProductModel data) => json.encode(data.toJson());

@freezed
abstract class DeleteProductModel with _$DeleteProductModel {
    const factory DeleteProductModel({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "title")
        String? title,
        @JsonKey(name: "price")
        double? price,
        @JsonKey(name: "description")
        String? description,
        @JsonKey(name: "category")
        String? category,
        @JsonKey(name: "image")
        String? image,
        @JsonKey(name: "rating")
        Rating? rating,
    }) = _DeleteProductModel;

    factory DeleteProductModel.fromJson(Map<String, dynamic> json) => _$DeleteProductModelFromJson(json);
}

@freezed
abstract class Rating with _$Rating {
    const factory Rating({
        @JsonKey(name: "rate")
        double? rate,
        @JsonKey(name: "count")
        int? count,
    }) = _Rating;

    factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
}
