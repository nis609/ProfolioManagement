import 'dart:isolate';

import 'package:coingecko_api/coingecko_api.dart';
import 'package:coingecko_api/data/coin.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:profolio_management/model/coin_data/coin.dart';
import 'package:profolio_management/model/coin_data/coin_item.dart';

import '../helper/flutterfire.dart';

class AppState with ChangeNotifier {
  String _dataUrl = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false";

  AppState();

  Future<List<CoinItem>?> fetchData() async {
    List<CoinItem>? coin=[];


    var data;
    var response;
     response = await http.get(Uri.parse(_dataUrl));
    final api = CoinGeckoApi();

    final result = await api.coins.listCoinMarkets(vsCurrency: "usd");


    result.data.forEach((e) async { {
      coin.add(CoinItem(
          id: e.id,
          image: e.image,
          last_updated: e.lastUpdated.toString(),
          name: e.name,
          current_price: e.currentPrice

      ));
      await updateCoinForBuy(e.name.toLowerCase(),e.currentPrice.toString());
      await updateCoin(e.name.toLowerCase(),e.currentPrice.toString());
      // await addCoin(dropdownValue, _counter.value.toString(),dropdownValue,"Buy",quantity.text,price.toString(),_counter.value.toString());
      notifyListeners();
    }
    });





    return  coin;;


  }
  Future<List<CoinItem>?> fetchDatas() async {
    List<CoinItem>? coin=[];


    var data;
    var response;
    response = await http.get(Uri.parse(_dataUrl));
    final api = CoinGeckoApi();

    final result = await api.coins.getCoinData(id: "bitcoin");
    print("sdasd");
    print("data"+ result.data!.description.toString());
    print("data"+ result.data!.publicInterestScore.toString());
    print("data"+ result.data!.marketData!.toString());
    print("data"+ result.data!.tickers.toString());
    print("data"+ result.data!.liquidityScore.toString());
    print("data"+ result.data!.publicInterestStats.toString());
    print("data"+ result.data!.publicNotice.toString());






    return  coin;


  }


}
