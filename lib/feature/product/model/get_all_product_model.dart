// To parse this JSON data, do
//
//     final getAllProductModel = getAllProductModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'get_all_product_model.freezed.dart';
part 'get_all_product_model.g.dart';

List<GetAllProductModel> getAllProductModelFromJson(String str) => List<GetAllProductModel>.from(json.decode(str).map((x) => GetAllProductModel.fromJson(x)));

String getAllProductModelToJson(List<GetAllProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
abstract class GetAllProductModel with _$GetAllProductModel {
    const factory GetAllProductModel({
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
    }) = _GetAllProductModel;

    factory GetAllProductModel.fromJson(Map<String, dynamic> json) => _$GetAllProductModelFromJson(json);
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
