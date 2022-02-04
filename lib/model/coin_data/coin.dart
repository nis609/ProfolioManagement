
import 'package:freezed_annotation/freezed_annotation.dart';

import 'coin_item.dart';


part 'coin.freezed.dart';
part 'coin.g.dart';

@freezed
class CoinData with _$CoinData {
  factory CoinData({
    @JsonKey(name: '') List<CoinItem>? coinData,

  }) = _CoinData;

  factory CoinData.fromJson(Map<String, dynamic> json) => _$CoinDataFromJson(json);
}