// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CoinItem _$_$_CoinItemFromJson(Map<String, dynamic> json) {
  return _$_CoinItem(
    id: json['id'] as String?,
    current_price: (json['current_price'] as num?)?.toDouble(),
    name: json['name'] as String?,
    image: json['image'] as String?,
    last_updated: json['last_updated'] as String?,
  );
}

Map<String, dynamic> _$_$_CoinItemToJson(_$_CoinItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'current_price': instance.current_price,
      'name': instance.name,
      'image': instance.image,
      'last_updated': instance.last_updated,
    };
