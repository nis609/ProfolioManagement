
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:profolio_management/custom/input_decorations.dart';
import 'package:profolio_management/helper/flutterfire.dart';
import 'package:profolio_management/helper/shared_value_helper.dart';
import 'package:profolio_management/model/coin_data/coin_item.dart';
import 'package:profolio_management/res/size_config.dart';
import 'package:profolio_management/screen/esewa_epay.dart';

class AddWallet extends StatefulWidget {
  List<CoinItem>? coin;
  CoinItem? coinItem;
  AddWallet({Key? key,this.coin,this.coinItem}) : super(key: key);

  @override
  _AddWalletState createState() => _AddWalletState();
}

class _AddWalletState extends State<AddWallet> {
  List<String> coins=[
  ];
  String dropdownValue="bittcoin";
  String transactionType="";
  TextEditingController amountTobeLoaded= TextEditingController();
  TextEditingController quantity= TextEditingController();
  double? price;
  @override
  void initState() {
    // TODO: implement initState
    coins=[
      "bitcoin",
      "ether",
      "Dodg",
      "tether"
    ];

    // price=widget.coinItem!.current_price;
    // dropdownValue=widget.coinItem!.name!;

  }
  final ValueNotifier<double> _counter = ValueNotifier<double>(0);
  @override
  Widget build(BuildContext context) {
SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Text("Wallet Add"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/wa.png"),

            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    //height: 36
                    child: TextFormField(
                      //maxLength: 10,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        LengthLimitingTextInputFormatter(10),

                      ],
                      textInputAction: TextInputAction.next,
                      controller: amountTobeLoaded,
                      autofocus: false,
                      validator: (val) =>
                      val!.isEmpty || !val.contains("@")
                          ? "enter a valid eamil"
                          : null,

                      decoration: InputDecorations
                          .buildInputDecoration_1(
                        hint_text: "Rs amount",
                      ),
                    ),
                  ),
                  // AddonConfig.otp_addon_installed
                  //     ? GestureDetector(
                  //         onTap: () {
                  //           setState(() {
                  //             _register_by = "phone";
                  //           });
                  //         },
                  //         child: Text(
                  //           "or, Register with a phone number",
                  //           style: TextStyle(
                  //               color: MyTheme.accent_color,
                  //               fontStyle: FontStyle.italic,
                  //               decoration:
                  //                   TextDecoration.underline),
                  //         ),
                  //       )
                  //     : Container()
                ],
              ),
            ),
            SizedBox(height: 50,),
            // Container(
            //   width: 300,
            //   child: TextFormField(
            //     controller: amountTobeLoaded,
            //     // obscureText: true,
            //     onChanged: (e){
            //       double a= double.parse(e);
            //       double? s= price;
            //       _counter.value=a*s!;
            //
            //     },
            //     decoration: InputDecoration(
            //         hintText: "Enter Amount",
            //         hintStyle: TextStyle(
            //             color: Colors.black38
            //         ),
            //         labelText: "Amount",
            //         labelStyle: TextStyle(
            //             color: Colors.black38
            //         )
            //     ),
            //   ),
            // ),
            MaterialButton(onPressed: ()async{

              Navigator.push(context, (MaterialPageRoute(
                  builder: (contxet){
                    return EsewaEpay(
                      amount: double.parse(amountTobeLoaded.text.toString()),


                    );
                  }
              )));

            },
              color :Colors.black54,
              child: Text("Proceeed",style: TextStyle(color: Colors.white),),
            ),

        ],),
      ),
    );
  }
}
Widget _customPopupItemBuilderForDistrict(
    BuildContext context, CoinItem item, bool isSelected) {
  return Container(
    height: 50,
    margin: EdgeInsets.symmetric(horizontal: 8),
    decoration: !isSelected
        ? null
        : BoxDecoration(
      border: Border.all(color: Theme.of(context).primaryColor),
      borderRadius: BorderRadius.circular(5),
      color: Colors.white,
    ),
    child: ListTile(
      selected: isSelected,
      title: Text(
        item.name.toString(),
        style: TextStyle(fontSize: 15),
      ),
    ),
  );
}