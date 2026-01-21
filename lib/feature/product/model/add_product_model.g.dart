// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddProductModel _$AddProductModelFromJson(Map<String, dynamic> json) =>
    _AddProductModel(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      description: json['description'] as String?,
      image: json['image'] as String?,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$AddProductModelToJson(_AddProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'description': instance.description,
      'image': instance.image,
      'category': instance.category,
    };
