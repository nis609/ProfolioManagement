// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CoinData _$_$_CoinDataFromJson(Map<String, dynamic> json) {
  return _$_CoinData(
    coinData: (json[''] as List<dynamic>?)
        ?.map((e) => CoinItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_CoinDataToJson(_$_CoinData instance) =>
    <String, dynamic>{
      '': instance.coinData,
    };
