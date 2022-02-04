import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profolio_management/helper/shared_value_helper.dart';
import 'package:profolio_management/model/user/user_coin_data.dart';
import 'package:profolio_management/provider/app_provider.dart';
import 'package:profolio_management/screen/dashboard_screen.dart';
import 'package:profolio_management/screen/home_screen.dart';
import 'package:profolio_management/screen/sell_page.dart';
import 'package:provider/provider.dart';

import 'esewa_epay.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  AppProvider? appProvider;
  List contacts=[];
  List<UserCoinData> ListOFuser=[];
  UserCoinData? userData;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
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
    return Scaffold(
      body: Column(
        children: [
          Image.asset("assets/l.png"),
          // TextFormField(
          //   controller: email,
          //   decoration: InputDecoration(
          //     hintText: "Enter your email",
          //     hintStyle: TextStyle(
          //       color: Colors.black38
          //     ),
          //     labelText: "Email",
          //     labelStyle: TextStyle(
          //       color: Colors.black38
          //     )
          //   ),
          // ),
          // TextFormField(
          //   controller: password,
          //   obscureText: true,
          //   decoration: InputDecoration(
          //       hintText: "Enter your password",
          //       hintStyle: TextStyle(
          //           color: Colors.black38
          //       ),
          //       labelText: "Password",
          //       labelStyle: TextStyle(
          //           color: Colors.black38
          //       )
          //   ),
          // ),
          // MaterialButton(onPressed: (){
          //   Navigator.push(context, (MaterialPageRoute(
          //       builder: (contxet){
          //         return HomeScreen(
          //
          //         );
          //       }
          //   )));
          // },
          //   color :Colors.black54,
          //   child: Text("Register"),
          // ),
          SizedBox(
            height: 50,
          ),
          Text("User can only login with Gmail account ",style: TextStyle(color: Colors.black45),),
          SizedBox(
            height: 50,
          ),
          MaterialButton(onPressed: onPressed,
          color :Colors.black45,
            child: Text("login with google",style:TextStyle(color: Colors.orange.shade200),),
          )
        ],
      ),
      // body: ListView.builder(itemCount: userData?.length,
      // itemBuilder: (BuildContext context, int index){
      //   print("asdasdasd");
      //   print(userData![index]);
      //   print("asdasdasd");
      //   final a= userData![index];
      //   return Container(
      //       height: 50,
      //       child: Text(a!.name.toString(),style: TextStyle(color: Colors.blue),));
      // },
      // ),
      // body: StreamBuilder<UserCoinData>(
      //   stream: appProvider?.getusertrnscation(),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasError) {
      //       return Center(
      //         child: Text(snapshot.error.toString()),
      //       );
      //     }
      //
      //     if (!snapshot.hasData) {
      //       return const Center(child: CircularProgressIndicator());
      //     }
      //
      //     final data = snapshot.requireData;
      //
      //     return Text(data.Amount.toString());
      //   },
      // ),
    );

    // return Scaffold(
    //   body: Column(
    //     children: [
    //       Container(
    //         height: 250,
    //         child: StreamBuilder(
    //           stream: FirebaseFirestore.instance
    //               .collection('users')
    //               .doc('M1AT64qPiQS7E1Rmmfvt5bU01K23')
    //               .collection('Coins')
    //               // .orderBy('createdAt')
    //               .snapshots(),
    //           builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
    //             if (snapshot.hasError) {
    //               return Center(
    //                 child: Text('Error'),
    //               );
    //             } else if (!snapshot.hasData) {
    //               return Center(
    //                 child: CircularProgressIndicator(),
    //               );
    //             } else {
    //               return ListView.builder(
    //                 itemCount: snapshot.data!.docs.length,
    //                 itemBuilder: (ctx, index) {
    //                   return InkWell(
    //                     onTap: (){
    //                       Navigator.push(context, (MaterialPageRoute(
    //                           builder: (contxet){
    //                             return SellView(
    //                               current_price: snapshot.data!.docs[index]['purchase_price'],
    //                               name: snapshot.data!.docs[index]['name'],
    //
    //
    //                             );
    //                           }
    //                       )));
    //                     },
    //                     child: Text(
    //                       snapshot.data!.docs[index]['purchase_price'].toString(),
    //                     ),
    //                   );
    //                 },
    //               );
    //             }
    //           },
    //         ),
    //       ),
    //       Container(
    //         height: 250,
    //         child: StreamBuilder(
    //           stream: FirebaseFirestore.instance
    //               .collection('users')
    //               .doc('M1AT64qPiQS7E1Rmmfvt5bU01K23')
    //               .collection('Wallet')
    //           // .orderBy('createdAt')
    //               .snapshots(),
    //           builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
    //             if (snapshot.hasError) {
    //               return Center(
    //                 child: Text('Error'),
    //               );
    //             } else if (!snapshot.hasData) {
    //
    //               return Center(
    //                 child: CircularProgressIndicator(),
    //               );
    //             } else {
    //
    //               return ListView.builder(
    //                 itemCount: snapshot.data!.docs.length,
    //                 itemBuilder: (ctx, index) {
    //                   final a =snapshot.data!.docs[index];
    //                   // ListOFuser.add(UserCoinData(Amount: a['Amount'], id:  a['Amount'], purchase_price:  a['Amount'], name:  a['Amount'], transaction_type:  a['Amount'], quantity:  a['Amount']));
    //                   // totalValue.$ =snapshot.data!.docs[index]['Amount'];
    //                   return Text(
    //                     snapshot.data!.docs[index]['Amount'].toString() ,
    //                   );
    //                 },
    //               );
    //             }
    //           },
    //         ),
    //       ),
    //        Container(
    //          height: 50,
    //          child: MaterialButton(onPressed: (){
    //            Navigator.push(context, (MaterialPageRoute(
    //                builder: (contxet){
    //                  return EsewaEpay(
    //
    //                  );
    //                }
    //            )));
    //          },
    //       color :Colors.black54,
    //           child: Text("login with google"),
    //       ),
    //        )
    //     ],
    //   ),
    // );
  }

  void onPressed() {
appProvider?.signInWithGoogle().whenComplete(() {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const DashboardScreen()),
  );
}).onError((error, stackTrace) {
  final  snackBar = SnackBar(
    content: Text(error.toString()),
  );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
  ScaffoldMessenger.of(context).showSnackBar(snackBar);

});
  }
}
