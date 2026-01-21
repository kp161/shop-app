// To parse this JSON data, do
//
//     final getOneProductModel = getOneProductModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'get_one_product_model.freezed.dart';
part 'get_one_product_model.g.dart';

GetOneProductModel getOneProductModelFromJson(String str) => GetOneProductModel.fromJson(json.decode(str));

String getOneProductModelToJson(GetOneProductModel data) => json.encode(data.toJson());

@freezed
abstract class GetOneProductModel with _$GetOneProductModel {
    const factory GetOneProductModel({
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
    }) = _GetOneProductModel;

    factory GetOneProductModel.fromJson(Map<String, dynamic> json) => _$GetOneProductModelFromJson(json);
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
