import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coingecko_api/coingecko_api.dart';
import 'package:coingecko_api/data/coin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profolio_management/helper/shared_value_helper.dart';
import 'package:profolio_management/model/coin_data/coin_item.dart';
import 'package:profolio_management/provider/coin_provider.dart';
import 'package:profolio_management/screen/add_view.dart';
import 'package:profolio_management/screen/esewa_epay.dart';
import 'package:profolio_management/screen/wallet_add.dart';
import 'package:provider/provider.dart';

class CoinDetailScreen extends StatefulWidget {
 final String? id;
  const CoinDetailScreen({Key? key,this.id}) : super(key: key);

  @override
  _CoinDetailScreenState createState() => _CoinDetailScreenState();
}

class _CoinDetailScreenState extends State<CoinDetailScreen> {
  AppState appState = new AppState() ;
  List<CoinItem>? coin;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    appState = Provider.of<AppState>(context,listen: false);
    se();
  }
  Coin? coindata;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

  }
  se() async{
    final api = CoinGeckoApi();

  final  coindatas = await api.coins.getCoinData(id: widget.id!.toLowerCase().toString());
    coindatas.data?.marketData?.dataByCurrency.forEach((element) {
      print(element.currentPrice);
    });

setState(() {
  print(coindatas.data);
  coindata=coindatas.data;
});
    //      .then((e) {
    //   e?.forEach((element) {
    // setState(() {
    //   coin?.add(CoinItem(
    //
    //       id: element?.id,
    //       image: element?.image,
    //       last_updated: element.last_updated.toString(),
    //       name: element.name
    //
    //   ));
    // });
    //
    //   });
    //
    //
    // }).onError((error, stackTrace) {
    //   print(error);
    //  });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Text("Coins Details"),
      ),
      backgroundColor: Colors.blueGrey[50],
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(100.0),
      //   child: SafeArea(
      //     child: AppBar(
      //         Left: GestureDetector(
      //             onTap: () => Navigator.pop(context),
      //             child: Icon(Icons.arrow_back_ios, color: Colors.black54)),
      //         title: 'Bitcoin Wallet',
      //         right: Icon(Icons.more_vert, color: Colors.black54)),
      //   ),
      // ),
      body: coindata==null?Center(child: CircularProgressIndicator(),):Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                // Text(coindata!.marketData!.dataByCurrency[7].currentPrice.toString()),
                _cardWallet(
                  iconUrl:
                  coindata?.image.toString(),
                  crypto:  coindata?.name.toString(),
                  cryptoShort:  coindata?.assetPlatformId,
                  totalCrypto:"Rs"+ coindata!.marketData!.dataByCurrency[7].currentPrice.toString(),
                  total: "PriceChange24h : Rs"+coindata!.marketData!.priceChange24h!.toStringAsFixed(2),
                  precent: coindata?.marketData?.marketCapChangePercentage24h,
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('365 Day(precentage perice chnages in year)'),

                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Card(

                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Padding(
                        //   padding: const EdgeInsets.all(20),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       Row(
                        //         children: [
                        //           _dot(color: Colors.pink),
                        //           Text(
                        //             'Lower: \"${coindata}"',
                        //             style: TextStyle(
                        //                 fontSize: 16,
                        //                 fontWeight: FontWeight.bold,
                        //                 color: Colors.black45),
                        //           ),
                        //         ],
                        //       ),
                        //       Row(
                        //         children: [
                        //           _dot(color: Colors.green),
                        //           Text(
                        //             'Higher:\$6.857',
                        //             style: TextStyle(
                        //                 fontSize: 16,
                        //                 fontWeight: FontWeight.bold,
                        //                 color: Colors.black45),
                        //           ),
                        //         ],
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 3,
                          child: Stack(children: [
                            LineChart(
                              sampleData(),
                            ),
                            Positioned(
                              bottom: 20,
                              left: 20,
                              child: Row(
                                children: [
                                  _dot(size: 18, color: Colors.orangeAccent),
                                  Text(
                                    "Rs "+coindata!.marketData!.priceChange24h.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
               // Row(
               //   children: [
               //     Text("Total Supply : ",style: TextStyle(fontWeight: FontWeight.w500),),
               //     Text(coindata!.marketData!.totalSupply.toString(),style: TextStyle(fontWeight: FontWeight.w700),),
               //   ],
               // ),
               // Row(
               //   children: [
               //     Text("PriceChangePercentage1y:",style: TextStyle(fontWeight: FontWeight.w500),),
               //     Text(coindata!.marketData!.priceChangePercentage1y.toString(),style: TextStyle(fontWeight: FontWeight.w700),),
               //   ],
               // ),
               // Row(
               //   children: [
               //     Text("PriceChange24h : ",style: TextStyle(fontWeight: FontWeight.w500),),
               //     Text(coindata!.marketData!.priceChange24h.toString(),style: TextStyle(fontWeight: FontWeight.w700),),
               //   ],
               // ),
               // Row(
               //   children: [
               //     Text("PriceChangePercentage7d :",style: TextStyle(fontWeight: FontWeight.w500),),
               //     Text(coindata!.marketData!.priceChangePercentage7d.toString(),style: TextStyle(fontWeight: FontWeight.w700),),
               //   ],
               // ),
               // Row(
               //   children: [
               //     Text("priceChangePercentage14d:",style: TextStyle(fontWeight: FontWeight.w500),),
               //     Text(coindata!.marketData!.priceChangePercentage14d.toString(),style: TextStyle(fontWeight: FontWeight.w700),),
               //   ],
               // ),

               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
                 child: Text(coindata!.description.toString()),
               )
              ],
            ),
          ),
        ),
      ),
    );
  }

  LineChartData sampleData() {
    return LineChartData(
      lineTouchData: LineTouchData(
        enabled: false,
      ),
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: false,
        ),
        leftTitles: SideTitles(
          showTitles: false,
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      // minX: 0,
      maxX: 365,
      maxY: 600,

      minY: -50,
      lineBarsData: linesBarData(),

    );
  }

  List<LineChartBarData> linesBarData() {
    return [
      LineChartBarData(
        spots: [
          FlSpot(365, coindata!.marketData!.priceChangePercentage1y!),
          FlSpot(200, coindata!.marketData!.priceChangePercentage200d!),
          FlSpot(60,coindata!.marketData!.priceChangePercentage60d!),
          FlSpot(60, coindata!.marketData!.priceChangePercentage30d!),
          FlSpot(24, coindata!.marketData!.priceChangePercentage24h!),
          FlSpot(14, coindata!.marketData!.priceChangePercentage14d!),
          FlSpot(7, coindata!.marketData!.priceChangePercentage7d!),
        ],
        isCurved: true,
        colors: const [
          Colors.orangeAccent,
        ],
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(show: true, colors: [
          Colors.orange.shade100,
        ]),
      ),
    ];
  }

  Widget _dot({double size = 10, Color color = Colors.black}) {
    return Container(
      margin: EdgeInsets.all(10),
      width: size,
      height: size,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20)),
        child: Container(
          color: color,
        ),
      ),
    );
  }

  Widget _cardWallet(
      {String ?crypto,
        cryptoShort,
        iconUrl,
        total,
        totalCrypto,
        double? precent}) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical:10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [



                  Expanded(
                    child: Text('$crypto',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  // Text('$cryptoShort')
                ],
              ),
            ),
            SizedBox(height: 5),
            Text(
              '$totalCrypto',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black87),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$total',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.black38),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                    decoration: BoxDecoration(
                        color: precent! >= 0 ? Colors.green : Colors.pink,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Text(
                      precent !>= 0 ? '+ $precent %' : '$precent %',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Center(
              child: Icon(Icons.keyboard_arrow_down,
                  size: 30, color: Colors.black45),
            )
          ],
        ),
      ),
    );
  }

  Widget _actionButton({Color? color, String? text}) {
    return Card(
        child: Column(
          children: [
            ClipOval(
              child: Material(
                color: color,
                child: InkWell(
                  splashColor: Colors.red, // inkwell color
                  child: SizedBox(
                      width: 56,
                      height: 56,
                      child: Icon(
                        Icons.attach_money,
                        color: Colors.white,
                        size: 25.0,
                      )),
                  onTap: () {},
                ),
              ),
            ),
            SizedBox(height: 10),
            Text('$text', style: TextStyle(fontSize: 24, color: Colors.black54))
          ],
        ));
  }
}
