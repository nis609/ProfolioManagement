// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'coin.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CoinData _$CoinDataFromJson(Map<String, dynamic> json) {
  return _CoinData.fromJson(json);
}

/// @nodoc
class _$CoinDataTearOff {
  const _$CoinDataTearOff();

  _CoinData call({@JsonKey(name: '') List<CoinItem>? coinData}) {
    return _CoinData(
      coinData: coinData,
    );
  }

  CoinData fromJson(Map<String, Object> json) {
    return CoinData.fromJson(json);
  }
}

/// @nodoc
const $CoinData = _$CoinDataTearOff();

/// @nodoc
mixin _$CoinData {
  @JsonKey(name: '')
  List<CoinItem>? get coinData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoinDataCopyWith<CoinData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoinDataCopyWith<$Res> {
  factory $CoinDataCopyWith(CoinData value, $Res Function(CoinData) then) =
      _$CoinDataCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: '') List<CoinItem>? coinData});
}

/// @nodoc
class _$CoinDataCopyWithImpl<$Res> implements $CoinDataCopyWith<$Res> {
  _$CoinDataCopyWithImpl(this._value, this._then);

  final CoinData _value;
  // ignore: unused_field
  final $Res Function(CoinData) _then;

  @override
  $Res call({
    Object? coinData = freezed,
  }) {
    return _then(_value.copyWith(
      coinData: coinData == freezed
          ? _value.coinData
          : coinData // ignore: cast_nullable_to_non_nullable
              as List<CoinItem>?,
    ));
  }
}

/// @nodoc
abstract class _$CoinDataCopyWith<$Res> implements $CoinDataCopyWith<$Res> {
  factory _$CoinDataCopyWith(_CoinData value, $Res Function(_CoinData) then) =
      __$CoinDataCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: '') List<CoinItem>? coinData});
}

/// @nodoc
class __$CoinDataCopyWithImpl<$Res> extends _$CoinDataCopyWithImpl<$Res>
    implements _$CoinDataCopyWith<$Res> {
  __$CoinDataCopyWithImpl(_CoinData _value, $Res Function(_CoinData) _then)
      : super(_value, (v) => _then(v as _CoinData));

  @override
  _CoinData get _value => super._value as _CoinData;

  @override
  $Res call({
    Object? coinData = freezed,
  }) {
    return _then(_CoinData(
      coinData: coinData == freezed
          ? _value.coinData
          : coinData // ignore: cast_nullable_to_non_nullable
              as List<CoinItem>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CoinData implements _CoinData {
  _$_CoinData({@JsonKey(name: '') this.coinData});

  factory _$_CoinData.fromJson(Map<String, dynamic> json) =>
      _$_$_CoinDataFromJson(json);

  @override
  @JsonKey(name: '')
  final List<CoinItem>? coinData;

  @override
  String toString() {
    return 'CoinData(coinData: $coinData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CoinData &&
            (identical(other.coinData, coinData) ||
                const DeepCollectionEquality()
                    .equals(other.coinData, coinData)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(coinData);

  @JsonKey(ignore: true)
  @override
  _$CoinDataCopyWith<_CoinData> get copyWith =>
      __$CoinDataCopyWithImpl<_CoinData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CoinDataToJson(this);
  }
}

abstract class _CoinData implements CoinData {
  factory _CoinData({@JsonKey(name: '') List<CoinItem>? coinData}) =
      _$_CoinData;

  factory _CoinData.fromJson(Map<String, dynamic> json) = _$_CoinData.fromJson;

  @override
  @JsonKey(name: '')
  List<CoinItem>? get coinData => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CoinDataCopyWith<_CoinData> get copyWith =>
      throw _privateConstructorUsedError;
}
