// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_one_product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetOneProductModel {
  @JsonKey(name: "id")
  int? get id;
  @JsonKey(name: "title")
  String? get title;
  @JsonKey(name: "price")
  double? get price;
  @JsonKey(name: "description")
  String? get description;
  @JsonKey(name: "category")
  String? get category;
  @JsonKey(name: "image")
  String? get image;
  @JsonKey(name: "rating")
  Rating? get rating;

  /// Create a copy of GetOneProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetOneProductModelCopyWith<GetOneProductModel> get copyWith =>
      _$GetOneProductModelCopyWithImpl<GetOneProductModel>(
          this as GetOneProductModel, _$identity);

  /// Serializes this GetOneProductModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetOneProductModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, price, description, category, image, rating);

  @override
  String toString() {
    return 'GetOneProductModel(id: $id, title: $title, price: $price, description: $description, category: $category, image: $image, rating: $rating)';
  }
}

/// @nodoc
abstract mixin class $GetOneProductModelCopyWith<$Res> {
  factory $GetOneProductModelCopyWith(
          GetOneProductModel value, $Res Function(GetOneProductModel) _then) =
      _$GetOneProductModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "price") double? price,
      @JsonKey(name: "description") String? description,
      @JsonKey(name: "category") String? category,
      @JsonKey(name: "image") String? image,
      @JsonKey(name: "rating") Rating? rating});

  $RatingCopyWith<$Res>? get rating;
}

/// @nodoc
class _$GetOneProductModelCopyWithImpl<$Res>
    implements $GetOneProductModelCopyWith<$Res> {
  _$GetOneProductModelCopyWithImpl(this._self, this._then);

  final GetOneProductModel _self;
  final $Res Function(GetOneProductModel) _then;

  /// Create a copy of GetOneProductModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? price = freezed,
    Object? description = freezed,
    Object? category = freezed,
    Object? image = freezed,
    Object? rating = freezed,
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
      category: freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as Rating?,
    ));
  }

  /// Create a copy of GetOneProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RatingCopyWith<$Res>? get rating {
    if (_self.rating == null) {
      return null;
    }

    return $RatingCopyWith<$Res>(_self.rating!, (value) {
      return _then(_self.copyWith(rating: value));
    });
  }
}

/// Adds pattern-matching-related methods to [GetOneProductModel].
extension GetOneProductModelPatterns on GetOneProductModel {
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
    TResult Function(_GetOneProductModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GetOneProductModel() when $default != null:
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
    TResult Function(_GetOneProductModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GetOneProductModel():
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
    TResult? Function(_GetOneProductModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GetOneProductModel() when $default != null:
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
            @JsonKey(name: "category") String? category,
            @JsonKey(name: "image") String? image,
            @JsonKey(name: "rating") Rating? rating)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GetOneProductModel() when $default != null:
        return $default(_that.id, _that.title, _that.price, _that.description,
            _that.category, _that.image, _that.rating);
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
            @JsonKey(name: "category") String? category,
            @JsonKey(name: "image") String? image,
            @JsonKey(name: "rating") Rating? rating)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GetOneProductModel():
        return $default(_that.id, _that.title, _that.price, _that.description,
            _that.category, _that.image, _that.rating);
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
            @JsonKey(name: "category") String? category,
            @JsonKey(name: "image") String? image,
            @JsonKey(name: "rating") Rating? rating)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GetOneProductModel() when $default != null:
        return $default(_that.id, _that.title, _that.price, _that.description,
            _that.category, _that.image, _that.rating);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _GetOneProductModel implements GetOneProductModel {
  const _GetOneProductModel(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "title") this.title,
      @JsonKey(name: "price") this.price,
      @JsonKey(name: "description") this.description,
      @JsonKey(name: "category") this.category,
      @JsonKey(name: "image") this.image,
      @JsonKey(name: "rating") this.rating});
  factory _GetOneProductModel.fromJson(Map<String, dynamic> json) =>
      _$GetOneProductModelFromJson(json);

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
  @JsonKey(name: "category")
  final String? category;
  @override
  @JsonKey(name: "image")
  final String? image;
  @override
  @JsonKey(name: "rating")
  final Rating? rating;

  /// Create a copy of GetOneProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GetOneProductModelCopyWith<_GetOneProductModel> get copyWith =>
      __$GetOneProductModelCopyWithImpl<_GetOneProductModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GetOneProductModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetOneProductModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, price, description, category, image, rating);

  @override
  String toString() {
    return 'GetOneProductModel(id: $id, title: $title, price: $price, description: $description, category: $category, image: $image, rating: $rating)';
  }
}

/// @nodoc
abstract mixin class _$GetOneProductModelCopyWith<$Res>
    implements $GetOneProductModelCopyWith<$Res> {
  factory _$GetOneProductModelCopyWith(
          _GetOneProductModel value, $Res Function(_GetOneProductModel) _then) =
      __$GetOneProductModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "price") double? price,
      @JsonKey(name: "description") String? description,
      @JsonKey(name: "category") String? category,
      @JsonKey(name: "image") String? image,
      @JsonKey(name: "rating") Rating? rating});

  @override
  $RatingCopyWith<$Res>? get rating;
}

/// @nodoc
class __$GetOneProductModelCopyWithImpl<$Res>
    implements _$GetOneProductModelCopyWith<$Res> {
  __$GetOneProductModelCopyWithImpl(this._self, this._then);

  final _GetOneProductModel _self;
  final $Res Function(_GetOneProductModel) _then;

  /// Create a copy of GetOneProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? price = freezed,
    Object? description = freezed,
    Object? category = freezed,
    Object? image = freezed,
    Object? rating = freezed,
  }) {
    return _then(_GetOneProductModel(
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
      category: freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as Rating?,
    ));
  }

  /// Create a copy of GetOneProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RatingCopyWith<$Res>? get rating {
    if (_self.rating == null) {
      return null;
    }

    return $RatingCopyWith<$Res>(_self.rating!, (value) {
      return _then(_self.copyWith(rating: value));
    });
  }
}

/// @nodoc
mixin _$Rating {
  @JsonKey(name: "rate")
  double? get rate;
  @JsonKey(name: "count")
  int? get count;

  /// Create a copy of Rating
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RatingCopyWith<Rating> get copyWith =>
      _$RatingCopyWithImpl<Rating>(this as Rating, _$identity);

  /// Serializes this Rating to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Rating &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, rate, count);

  @override
  String toString() {
    return 'Rating(rate: $rate, count: $count)';
  }
}

/// @nodoc
abstract mixin class $RatingCopyWith<$Res> {
  factory $RatingCopyWith(Rating value, $Res Function(Rating) _then) =
      _$RatingCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "rate") double? rate,
      @JsonKey(name: "count") int? count});
}

/// @nodoc
class _$RatingCopyWithImpl<$Res> implements $RatingCopyWith<$Res> {
  _$RatingCopyWithImpl(this._self, this._then);

  final Rating _self;
  final $Res Function(Rating) _then;

  /// Create a copy of Rating
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rate = freezed,
    Object? count = freezed,
  }) {
    return _then(_self.copyWith(
      rate: freezed == rate
          ? _self.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double?,
      count: freezed == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [Rating].
extension RatingPatterns on Rating {
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
    TResult Function(_Rating value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Rating() when $default != null:
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
    TResult Function(_Rating value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Rating():
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
    TResult? Function(_Rating value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Rating() when $default != null:
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
    TResult Function(@JsonKey(name: "rate") double? rate,
            @JsonKey(name: "count") int? count)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Rating() when $default != null:
        return $default(_that.rate, _that.count);
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
    TResult Function(@JsonKey(name: "rate") double? rate,
            @JsonKey(name: "count") int? count)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Rating():
        return $default(_that.rate, _that.count);
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
    TResult? Function(@JsonKey(name: "rate") double? rate,
            @JsonKey(name: "count") int? count)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Rating() when $default != null:
        return $default(_that.rate, _that.count);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Rating implements Rating {
  const _Rating(
      {@JsonKey(name: "rate") this.rate, @JsonKey(name: "count") this.count});
  factory _Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);

  @override
  @JsonKey(name: "rate")
  final double? rate;
  @override
  @JsonKey(name: "count")
  final int? count;

  /// Create a copy of Rating
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RatingCopyWith<_Rating> get copyWith =>
      __$RatingCopyWithImpl<_Rating>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RatingToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Rating &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, rate, count);

  @override
  String toString() {
    return 'Rating(rate: $rate, count: $count)';
  }
}

/// @nodoc
abstract mixin class _$RatingCopyWith<$Res> implements $RatingCopyWith<$Res> {
  factory _$RatingCopyWith(_Rating value, $Res Function(_Rating) _then) =
      __$RatingCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "rate") double? rate,
      @JsonKey(name: "count") int? count});
}

/// @nodoc
class __$RatingCopyWithImpl<$Res> implements _$RatingCopyWith<$Res> {
  __$RatingCopyWithImpl(this._self, this._then);

  final _Rating _self;
  final $Res Function(_Rating) _then;

  /// Create a copy of Rating
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? rate = freezed,
    Object? count = freezed,
  }) {
    return _then(_Rating(
      rate: freezed == rate
          ? _self.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double?,
      count: freezed == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
