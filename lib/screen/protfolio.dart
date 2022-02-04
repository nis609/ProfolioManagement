import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coingecko_api/coingecko_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profolio_management/helper/shared_value_helper.dart';
import 'package:profolio_management/model/user/user_coin_data.dart';
import 'package:profolio_management/provider/app_provider.dart';
import 'package:profolio_management/res/size_config.dart';
import 'package:profolio_management/screen/add_view.dart';
import 'package:profolio_management/screen/home_screen.dart';
import 'package:profolio_management/screen/sell_list.dart';
import 'package:profolio_management/screen/sell_page.dart';
import 'package:profolio_management/screen/wallet_add.dart';
import 'package:provider/provider.dart';

import 'esewa_epay.dart';

class ProtfolioScreen extends StatefulWidget {
  const ProtfolioScreen({Key? key}) : super(key: key);

  @override
  _ProtfolioScreenState createState() => _ProtfolioScreenState();
}

class _ProtfolioScreenState extends State<ProtfolioScreen> {
  AppProvider? appProvider;
  List contacts=[];
  List<UserCoinData> ListOFuser=[];
  UserCoinData? userData;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final ValueNotifier<double> priceDiffernce = ValueNotifier<double>(0);
  final ValueNotifier<double> priceperStockDiffernce = ValueNotifier<double>(0);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    appProvider =Provider.of<AppProvider>(context,listen: false);

    se();
  }
  se(){

  }
  @override
  Widget build(BuildContext context) {


return Column(
  children: [
    SizedBox(
      height: 25,
    ),

            Container(
            height: SizeConfig.screenWidth!/1.8,
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(access_token.$)
                  .collection('Wallet')
              // .orderBy('createdAt')
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error'),
                  );
                } else if (!snapshot.hasData) {

                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {


                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (ctx, index) {

                      totalValue.$= double.parse(("${snapshot.data!.docs[index]['Amount'].toStringAsFixed(2)}"));
                      priceDiffernce.value= snapshot.data!.docs[index]['Amount']-snapshot.data!.docs[index]['total_investment'];
                      print(totalValue.$);
                      final a =snapshot.data!.docs[index];
                      // ListOFuser.add(UserCoinData(Amount: a['Amount'], id:  a['Amount'], purchase_price:  a['Amount'], name:  a['Amount'], transaction_type:  a['Amount'], quantity:  a['Amount']));
                      // totalValue.$ =snapshot.data!.docs[index]['Amount'];
                      return _cardWalletBalance(context,
                            total: totalValue.$.toString(),
                            totalCrypto: snapshot.data!.docs[index]['total_investment'].toStringAsFixed(2),
                            precent: -2.999);

                    },
                  );
                }
              },
            ),
          ),
    SizedBox(
      height: 15,
    ),
    // Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 25),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: [
    //       Text('Sorted by higher %',
    //           style: TextStyle(color: Colors.black45)),
    //       Row(children: [
    //         Text(
    //           '24H',
    //           style: TextStyle(color: Colors.black45),
    //         ),
    //         Icon(Icons.keyboard_arrow_down, color: Colors.black45),
    //       ])
    //     ],
    //   ),
    // ),
    // SizedBox(
    //   height: 15,
    // ),
    Expanded(

      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(access_token.$)
            .collection('Coins').
        doc('M1AT64qPiQS7E1Rmmfvt5bU01K23').collection('Buy')
        // .orderBy('createdAt')
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error'),
            );
          } else if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return snapshot.data!.docs.length==null?Center(child: Text("tour purchase history is empty"),):ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (ctx, index) {

                final purchaseData=snapshot.data!.docs[index];
               double percent = snapshot.data!.docs[index]['current_price']-snapshot.data!.docs[index]['purchase_price'];
              String s= percent.toStringAsFixed(2);
                return
                  _listCryptoItem(
                  iconUrl:
                  purchaseData['image'],
                  myCrypto: purchaseData['name'],
                  purchasePrice: purchaseData['purchase_price'],
                  quantity: purchaseData['quantity'],
                  currentPrice: purchaseData['current_price'],
                  precent: double.parse(s),
                    cureentPrice: purchaseData['current_price']
                );
              },
            );
          }
        },
      ),
    ),

  ],
);

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 250,
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc('M1AT64qPiQS7E1Rmmfvt5bU01K23')
                  .collection('Coins').
              doc('M1AT64qPiQS7E1Rmmfvt5bU01K23').collection('Buy')
                  // .orderBy('createdAt')
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error'),
                  );
                } else if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (ctx, index) {
                      return InkWell(
                        onTap: (){
                          Navigator.push(context, (MaterialPageRoute(
                              builder: (contxet){
                                return SellView(
                                  current_price: snapshot.data!.docs[index]['purchase_price'],
                                  name: snapshot.data!.docs[index]['name'],


                                );
                              }
                          )));
                        },
                        child: Text(
                          snapshot.data!.docs[index]['purchase_price'].toString(),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
          Container(
            height: 250,
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc('M1AT64qPiQS7E1Rmmfvt5bU01K23')
                  .collection('Wallet')
              // .orderBy('createdAt')
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error'),
                  );
                } else if (!snapshot.hasData) {

                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {

                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (ctx, index) {
                      totalValue.$= double.parse("${snapshot.data!.docs[index]['Amount']}");

                      print(totalValue.$);
                      final a =snapshot.data!.docs[index];
                      // ListOFuser.add(UserCoinData(Amount: a['Amount'], id:  a['Amount'], purchase_price:  a['Amount'], name:  a['Amount'], transaction_type:  a['Amount'], quantity:  a['Amount']));
                      // totalValue.$ =snapshot.data!.docs[index]['Amount'];
                      return Text(
                        snapshot.data!.docs[index]['Amount'].toString() ,
                      );
                    },
                  );
                }
              },
            ),
          ),
           Container(
             height: 50,
             child: MaterialButton(onPressed: (){
               Navigator.push(context, (MaterialPageRoute(
                   builder: (contxet){
                     return EsewaEpay(

                     );
                   }
               )));
             },
          color :Colors.black54,
              child: Text("login with google"),
          ),
           )
        ],
      ),
    );
  }
coid(String id)async{
  final api = CoinGeckoApi();
  final  coindatas = await api.coins.getCoinData(id:id.toLowerCase().toString());
    print(coindatas.data!.id);
}
  Widget _cardWalletBalance(BuildContext context,
      {String? total, totalCrypto, double? precent}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        width: MediaQuery.of(context).size.width - 50,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipOval(
                      child: Material(
                        color: Colors.black87,
                        child: InkWell(
                          splashColor: Colors.red, // inkwell color
                          child: SizedBox(
                              width: 56,
                              height: 56,
                              child: Icon(
                                Icons.account_balance_wallet,
                                color: Colors.white,
                                size: 25.0,
                              )),
                          onTap: () {},
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: totalValue.$==0?Text("Insufficient balance, please recharge",style: TextStyle(fontWeight: FontWeight.bold)):Text('Total Wallet Balance',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Row(
                      children: [Text('Rs'), Icon(Icons.keyboard_arrow_down)],
                    )
                  ],
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Rs"'$total',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: Colors.black87),
                        ),

                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                          decoration: BoxDecoration(
                              color: priceDiffernce.value.toString().contains("-")?  Colors.pink: Colors.green,
                              borderRadius: BorderRadius.all(Radius.circular(30))),
                          child:  ValueListenableBuilder<double>(
                            builder: (BuildContext context, double value, Widget? child) {
                              // This builder will only get called when the _counter
                              // is updated.
                              return  Text("Rs "'${value.toStringAsFixed(2)}',style: TextStyle(color: Colors.white),);
                            },
                            valueListenable: priceDiffernce,
                            // The child parameter is most helpful if the child is
                            // expensive to build and does not depend on the value from
                            // the notifier.
                            child: Text(""),
                          ),
                        ),

                      ],
                    )
                  ],
                ),

                Row(
                  children: [
                    Text("Total Purchase : "),

                    // Text(sums.toStringAsFixed(2),style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold))
                    // Container(
                    //   padding: EdgeInsets.symmetric(horizontal: 2, vertical: 7),
                    //   // decoration: BoxDecoration(
                    //   //     color: total_Sales.value.toString().contains("-")?  Colors.pink: Colors.green,
                    //   //     borderRadius: BorderRadius.all(Radius.circular(30))),
                    //   child:  ValueListenableBuilder<double>(
                    //     builder: (BuildContext context, double value, Widget? child) {
                    //       // This builder will only get called when the _counter
                    //       // is updated.
                    //       return  Text("Rs "'${value.toStringAsFixed(2)}',style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold),);
                    //     },
                    //     valueListenable: total_Sales,
                    //     // The child parameter is most helpful if the child is
                    //     // expensive to build and does not depend on the value from
                    //     // the notifier.
                    //     child: Text(""),
                    //   ),
                    // ),
                  ],
                ),
                Container(
                  height: 15,
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .doc(access_token.$).collection("Coins").
                    doc(access_token.$).collection('TotalSales')
                    // .orderBy('createdAt')
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      print(snapshot.data!.docs.isEmpty);
                      if (snapshot.hasError) {
                        return Center(
                          child: Text('Error'),
                        );
                      } else if (!snapshot.hasData) {

                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {

                        return snapshot.data!.docs.isEmpty==true ?SingleChildScrollView(
                          child: Column(
                            children: [
                              Image.asset("assets/l.png",height: 150,),
                              Text("Please Login to see data",style: TextStyle(color:Colors.pink),),
                            ],
                          ),
                        ): ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (ctx, index) {

                            // ListOFuser.add(UserCoinData(Amount: a['Amount'], id:  a['Amount'], purchase_price:  a['Amount'], name:  a['Amount'], transaction_type:  a['Amount'], quantity:  a['Amount']));
                            // totalValue.$ =snapshot.data!.docs[index]['Amount'];
                            return  Text("Rs"+snapshot.data!.docs[index]['Amount'].toString(),style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold),);

                          },
                        );
                      }
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total investment : $totalCrypto',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black38),
                    ),
                    // Container(
                    //   padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                    //   decoration: BoxDecoration(
                    //       color: precent! >= 0 ? Colors.orange.shade300 : Colors.orange.shade300,
                    //       borderRadius: BorderRadius.all(Radius.circular(30))),
                    //   child: Text(
                    //    "Add Wallet",
                    //     style: TextStyle(
                    //       color: Colors.white,
                    //       fontSize: 15,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    // ),
                    MaterialButton(onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  AddWallet()),
                      );

                    },color: Colors.orange.shade300,
                      child: Text("Add Wallet"),
                    )
                  ],
                ),
                // Center(
                //   child: Icon(Icons.keyboard_arrow_down,
                //       size: 30, color: Colors.black45),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _listCryptoItem(
      {String? iconUrl,
        double precent = 0,
        String? myCrypto,
        purchasePrice,
        double? cureentPrice,
        int? quantity,
        currentPrice}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(
                '$iconUrl',
                width: 50,
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '$myCrypto',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      '$quantity '+"(number of quantity)",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    Text(
                      "Rs "'$currentPrice',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black45,
                      ),

                    ),
                    Row(
                      children: [
                        Text(
                          "Rs "'$purchasePrice   ',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          precent >= 0 ? '$precent Rs': precent >= 0 ? '+ $precent Rs' : '$precent Rs',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: precent >= 0 ? Colors.green : Colors.pink,
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  MaterialButton(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  SellView(
                        purchasePrice:purchasePrice ,
                        current_price: cureentPrice,
                        quantity:quantity ,
                        name: myCrypto,
                        image: iconUrl,


                      )),
                    );
                  },
                    color: Colors.red,
                  child: Text("Sell",style: TextStyle(color: Colors.white),),

                  )

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  void onPressed() {
    appProvider?.signInWithGoogle();
  }
}


