// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

List<UserModel> userModelFromJson(String str) => List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
abstract class UserModel with _$UserModel {
    const factory UserModel({
        @JsonKey(name: "address")
        Address? address,
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "email")
        String? email,
        @JsonKey(name: "username")
        String? username,
        @JsonKey(name: "password")
        String? password,
        @JsonKey(name: "name")
        Name? name,
        @JsonKey(name: "phone")
        String? phone,
        @JsonKey(name: "__v")
        int? v,
    }) = _UserModel;

    factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}

@freezed
abstract class Address with _$Address {
    const factory Address({
        @JsonKey(name: "geolocation")
        Geolocation? geolocation,
        @JsonKey(name: "city")
        String? city,
        @JsonKey(name: "street")
        String? street,
        @JsonKey(name: "number")
        int? number,
        @JsonKey(name: "zipcode")
        String? zipcode,
    }) = _Address;

    factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
}

@freezed
abstract class Geolocation with _$Geolocation {
    const factory Geolocation({
        @JsonKey(name: "lat")
        String? lat,
        @JsonKey(name: "long")
        String? long,
    }) = _Geolocation;

    factory Geolocation.fromJson(Map<String, dynamic> json) => _$GeolocationFromJson(json);
}

@freezed
abstract class Name with _$Name {
    const factory Name({
        @JsonKey(name: "firstname")
        String? firstname,
        @JsonKey(name: "lastname")
        String? lastname,
    }) = _Name;

    factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);
}
