// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'coin_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CoinItem _$CoinItemFromJson(Map<String, dynamic> json) {
  return _CoinItem.fromJson(json);
}

/// @nodoc
class _$CoinItemTearOff {
  const _$CoinItemTearOff();

  _CoinItem call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'current_price') double? current_price,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'image') String? image,
      @JsonKey(name: 'last_updated') String? last_updated}) {
    return _CoinItem(
      id: id,
      current_price: current_price,
      name: name,
      image: image,
      last_updated: last_updated,
    );
  }

  CoinItem fromJson(Map<String, Object> json) {
    return CoinItem.fromJson(json);
  }
}

/// @nodoc
const $CoinItem = _$CoinItemTearOff();

/// @nodoc
mixin _$CoinItem {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_price')
  double? get current_price => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_updated')
  String? get last_updated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoinItemCopyWith<CoinItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoinItemCopyWith<$Res> {
  factory $CoinItemCopyWith(CoinItem value, $Res Function(CoinItem) then) =
      _$CoinItemCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'current_price') double? current_price,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'image') String? image,
      @JsonKey(name: 'last_updated') String? last_updated});
}

/// @nodoc
class _$CoinItemCopyWithImpl<$Res> implements $CoinItemCopyWith<$Res> {
  _$CoinItemCopyWithImpl(this._value, this._then);

  final CoinItem _value;
  // ignore: unused_field
  final $Res Function(CoinItem) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? current_price = freezed,
    Object? name = freezed,
    Object? image = freezed,
    Object? last_updated = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      current_price: current_price == freezed
          ? _value.current_price
          : current_price // ignore: cast_nullable_to_non_nullable
              as double?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      last_updated: last_updated == freezed
          ? _value.last_updated
          : last_updated // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$CoinItemCopyWith<$Res> implements $CoinItemCopyWith<$Res> {
  factory _$CoinItemCopyWith(_CoinItem value, $Res Function(_CoinItem) then) =
      __$CoinItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'current_price') double? current_price,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'image') String? image,
      @JsonKey(name: 'last_updated') String? last_updated});
}

/// @nodoc
class __$CoinItemCopyWithImpl<$Res> extends _$CoinItemCopyWithImpl<$Res>
    implements _$CoinItemCopyWith<$Res> {
  __$CoinItemCopyWithImpl(_CoinItem _value, $Res Function(_CoinItem) _then)
      : super(_value, (v) => _then(v as _CoinItem));

  @override
  _CoinItem get _value => super._value as _CoinItem;

  @override
  $Res call({
    Object? id = freezed,
    Object? current_price = freezed,
    Object? name = freezed,
    Object? image = freezed,
    Object? last_updated = freezed,
  }) {
    return _then(_CoinItem(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      current_price: current_price == freezed
          ? _value.current_price
          : current_price // ignore: cast_nullable_to_non_nullable
              as double?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      last_updated: last_updated == freezed
          ? _value.last_updated
          : last_updated // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CoinItem implements _CoinItem {
  _$_CoinItem(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'current_price') this.current_price,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'image') this.image,
      @JsonKey(name: 'last_updated') this.last_updated});

  factory _$_CoinItem.fromJson(Map<String, dynamic> json) =>
      _$_$_CoinItemFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'current_price')
  final double? current_price;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'image')
  final String? image;
  @override
  @JsonKey(name: 'last_updated')
  final String? last_updated;

  @override
  String toString() {
    return 'CoinItem(id: $id, current_price: $current_price, name: $name, image: $image, last_updated: $last_updated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CoinItem &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.current_price, current_price) ||
                const DeepCollectionEquality()
                    .equals(other.current_price, current_price)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.last_updated, last_updated) ||
                const DeepCollectionEquality()
                    .equals(other.last_updated, last_updated)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(current_price) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(last_updated);

  @JsonKey(ignore: true)
  @override
  _$CoinItemCopyWith<_CoinItem> get copyWith =>
      __$CoinItemCopyWithImpl<_CoinItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CoinItemToJson(this);
  }
}

abstract class _CoinItem implements CoinItem {
  factory _CoinItem(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'current_price') double? current_price,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'image') String? image,
      @JsonKey(name: 'last_updated') String? last_updated}) = _$_CoinItem;

  factory _CoinItem.fromJson(Map<String, dynamic> json) = _$_CoinItem.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'current_price')
  double? get current_price => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'image')
  String? get image => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'last_updated')
  String? get last_updated => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CoinItemCopyWith<_CoinItem> get copyWith =>
      throw _privateConstructorUsedError;
}
