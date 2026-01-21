// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateProductModel {
  @JsonKey(name: "id")
  int? get id;
  @JsonKey(name: "title")
  String? get title;
  @JsonKey(name: "price")
  double? get price;
  @JsonKey(name: "description")
  String? get description;
  @JsonKey(name: "image")
  String? get image;
  @JsonKey(name: "category")
  String? get category;

  /// Create a copy of UpdateProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateProductModelCopyWith<UpdateProductModel> get copyWith =>
      _$UpdateProductModelCopyWithImpl<UpdateProductModel>(
          this as UpdateProductModel, _$identity);

  /// Serializes this UpdateProductModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateProductModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, price, description, image, category);

  @override
  String toString() {
    return 'UpdateProductModel(id: $id, title: $title, price: $price, description: $description, image: $image, category: $category)';
  }
}

/// @nodoc
abstract mixin class $UpdateProductModelCopyWith<$Res> {
  factory $UpdateProductModelCopyWith(
          UpdateProductModel value, $Res Function(UpdateProductModel) _then) =
      _$UpdateProductModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "price") double? price,
      @JsonKey(name: "description") String? description,
      @JsonKey(name: "image") String? image,
      @JsonKey(name: "category") String? category});
}

/// @nodoc
class _$UpdateProductModelCopyWithImpl<$Res>
    implements $UpdateProductModelCopyWith<$Res> {
  _$UpdateProductModelCopyWithImpl(this._self, this._then);

  final UpdateProductModel _self;
  final $Res Function(UpdateProductModel) _then;

  /// Create a copy of UpdateProductModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? price = freezed,
    Object? description = freezed,
    Object? image = freezed,
    Object? category = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [UpdateProductModel].
extension UpdateProductModelPatterns on UpdateProductModel {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_UpdateProductModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UpdateProductModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_UpdateProductModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateProductModel():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_UpdateProductModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateProductModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: "id") int? id,
            @JsonKey(name: "title") String? title,
            @JsonKey(name: "price") double? price,
            @JsonKey(name: "description") String? description,
            @JsonKey(name: "image") String? image,
            @JsonKey(name: "category") String? category)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UpdateProductModel() when $default != null:
        return $default(_that.id, _that.title, _that.price, _that.description,
            _that.image, _that.category);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: "id") int? id,
            @JsonKey(name: "title") String? title,
            @JsonKey(name: "price") double? price,
            @JsonKey(name: "description") String? description,
            @JsonKey(name: "image") String? image,
            @JsonKey(name: "category") String? category)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateProductModel():
        return $default(_that.id, _that.title, _that.price, _that.description,
            _that.image, _that.category);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(name: "id") int? id,
            @JsonKey(name: "title") String? title,
            @JsonKey(name: "price") double? price,
            @JsonKey(name: "description") String? description,
            @JsonKey(name: "image") String? image,
            @JsonKey(name: "category") String? category)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateProductModel() when $default != null:
        return $default(_that.id, _that.title, _that.price, _that.description,
            _that.image, _that.category);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UpdateProductModel implements UpdateProductModel {
  const _UpdateProductModel(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "title") this.title,
      @JsonKey(name: "price") this.price,
      @JsonKey(name: "description") this.description,
      @JsonKey(name: "image") this.image,
      @JsonKey(name: "category") this.category});
  factory _UpdateProductModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateProductModelFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "title")
  final String? title;
  @override
  @JsonKey(name: "price")
  final double? price;
  @override
  @JsonKey(name: "description")
  final String? description;
  @override
  @JsonKey(name: "image")
  final String? image;
  @override
  @JsonKey(name: "category")
  final String? category;

  /// Create a copy of UpdateProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateProductModelCopyWith<_UpdateProductModel> get copyWith =>
      __$UpdateProductModelCopyWithImpl<_UpdateProductModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UpdateProductModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateProductModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, price, description, image, category);

  @override
  String toString() {
    return 'UpdateProductModel(id: $id, title: $title, price: $price, description: $description, image: $image, category: $category)';
  }
}

/// @nodoc
abstract mixin class _$UpdateProductModelCopyWith<$Res>
    implements $UpdateProductModelCopyWith<$Res> {
  factory _$UpdateProductModelCopyWith(
          _UpdateProductModel value, $Res Function(_UpdateProductModel) _then) =
      __$UpdateProductModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "price") double? price,
      @JsonKey(name: "description") String? description,
      @JsonKey(name: "image") String? image,
      @JsonKey(name: "category") String? category});
}

/// @nodoc
class __$UpdateProductModelCopyWithImpl<$Res>
    implements _$UpdateProductModelCopyWith<$Res> {
  __$UpdateProductModelCopyWithImpl(this._self, this._then);

  final _UpdateProductModel _self;
  final $Res Function(_UpdateProductModel) _then;

  /// Create a copy of UpdateProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? price = freezed,
    Object? description = freezed,
    Object? image = freezed,
    Object? category = freezed,
  }) {
    return _then(_UpdateProductModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
