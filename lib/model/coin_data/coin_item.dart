import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin_item.freezed.dart';
part 'coin_item.g.dart';

@freezed
class CoinItem with _$CoinItem {
  factory CoinItem({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'current_price') double? current_price,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'image') String? image,

    @JsonKey(name: 'last_updated') String? last_updated,

  }) = _CoinItem;

  factory CoinItem.fromJson(Map<String, dynamic> json) => _$CoinItemFromJson(json);
}