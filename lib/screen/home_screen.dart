import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profolio_management/helper/shared_value_helper.dart';
import 'package:profolio_management/model/coin_data/coin_item.dart';
import 'package:profolio_management/provider/coin_provider.dart';
import 'package:profolio_management/screen/add_view.dart';
import 'package:profolio_management/screen/coin_details.dart';
import 'package:profolio_management/screen/esewa_epay.dart';
import 'package:profolio_management/screen/wallet_add.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AppState appState = new AppState() ;
  List<CoinItem>? coin;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    appState = Provider.of<AppState>(context,listen: false);
    se();
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

  }
  se() async{
    print(access_token.$);
    print(is_logged_in.$);
     var coins = await appState.fetchData();
     setState(() {
       coin =coins;

     });
     var coindata= await appState.fetchDatas();
     print(coindata);
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
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black45,
        title: Text("Coin Price list(in Rs)"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: (){

        },
        child: Text("Buy Now"),
      ),
      body: RefreshIndicator(
        onRefresh: ()async{
          se();
        },
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child:
            coin==null?Center(child: CircularProgressIndicator()):ListView.builder(

              primary: false,
              shrinkWrap: true,
              itemCount: coin?.length,
              itemBuilder: (context, index) {

                return    InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  CoinDetailScreen(id:coin![index].id ,)),
                    );
                  },
                  child: _listCryptoItem(
                    iconUrl:
                    coin![index].image,
                    myCrypto: coin![index].name,
                    myBalance: coin![index].current_price,
                    myProfit: '\$19.153',
                    precent: 4.32,
                    coins: coin!,
                    coinsItem: coin![index]

                  ),
                );;
              },
            )
          ),
        ),
      ),
    );
  }
  Widget _listCryptoItem(
      {String? iconUrl,
        double precent = 0,
        String? myCrypto,
        myBalance,
        myProfit,
        List<CoinItem>? coins,
        CoinItem ?coinsItem

      }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(5),
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
                  // Text(
                  //   '$myProfit',
                  //   style: TextStyle(
                  //     fontWeight: FontWeight.bold,
                  //     color: Colors.black45,
                  //   ),
                  //
                  // ),
                  Text(
                    '$myBalance',
                    style: TextStyle(   fontWeight: FontWeight.bold,
                          color: Colors.black45,),
                  ),
                  Text(
                    precent >= 0 ? '+ $precent %' : '$precent %',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: precent >= 0 ? Colors.green : Colors.pink,
                    ),
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
                          MaterialPageRoute(builder: (context) =>  Addview(
                            coinItem: coinsItem,
                            coin: coin,

                          )),
                        );
                      },
                        color: Colors.green,
                      child:Text("Buy",style: TextStyle(color: Colors.white),) ,
                      )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
