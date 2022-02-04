
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:profolio_management/custom/input_decorations.dart';
import 'package:profolio_management/helper/flutterfire.dart';
import 'package:profolio_management/helper/shared_value_helper.dart';
import 'package:profolio_management/model/coin_data/coin_item.dart';
import 'package:profolio_management/screen/dashboard_screen.dart';

class Addview extends StatefulWidget {
  List<CoinItem>? coin;
  CoinItem? coinItem;
   Addview({Key? key,this.coin,this.coinItem}) : super(key: key);

  @override
  _AddviewState createState() => _AddviewState();
}

class _AddviewState extends State<Addview> {
  List<String> coins=[
  ];
  String dropdownValue="bittcoin";
  String transactionType="";
  TextEditingController amount= TextEditingController();
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

price=widget.coinItem!.current_price;
    dropdownValue=widget.coinItem!.name!;

  }
  final ValueNotifier<double> _counter = ValueNotifier<double>(0);
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 700,
      width: 500,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black45,
          title: Text("Purchase Coins"),
        ),
        body:
        // Column(
        //   children: [
        //     Container(
        //
        //       child: DropdownSearch<CoinItem>(
        //         items: widget.coin,
        //         mode: Mode.MENU,
        //         maxHeight: MediaQuery.of(context).size.height - 100,
        //         validator: (u) => u == null ? "District is required " : null,
        //
        //
        //         showSearchBox: true,
        //         label: "Select a District",
        //         itemAsString: (CoinItem? u) => u!.name!,
        //         popupItemBuilder: _customPopupItemBuilderForDistrict,
        //         dropdownSearchDecoration: InputDecoration(
        //             hintText: "Enter City",
        //             errorBorder: OutlineInputBorder(
        //               borderSide: BorderSide(
        //                 color: Colors.black26,
        //                 width: 0.5,
        //               ),
        //               borderRadius: const BorderRadius.all(
        //                 const Radius.circular(8.0),
        //               ),
        //             ),
        //             hintStyle: TextStyle(
        //                 fontSize: 15, color: Colors.black26),
        //             enabledBorder: OutlineInputBorder(
        //               borderSide: BorderSide(color: Colors.black26, width: 0.5),
        //               borderRadius: const BorderRadius.all(
        //                 const Radius.circular(8.0),
        //               ),
        //             ),
        //             focusedBorder: OutlineInputBorder(
        //               borderSide: BorderSide(color: Colors.black26, width: 1.0),
        //               borderRadius: const BorderRadius.all(
        //                 const Radius.circular(8.0),
        //               ),
        //             ),
        //             contentPadding: EdgeInsets.only(left: 8.0)),
        //         onChanged: (e) async {
        //           // addAddressModel.district = e!.id.toString();
        //           // await store.getCity(e.id.toString());
        //         },
        //       ),
        //     ),
        //   ],
        // )
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Coin Name",
                    style: TextStyle(
                      color: Colors.grey[400],
                      //    fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              ),

              // DropdownButton<CoinItem>(
              //   // value: dropdownValue,
              //   icon: Icon(Icons.arrow_drop_down_circle),
              //   iconSize: 30,
              //   elevation: 16,
              //   style: TextStyle(color: Colors.teal),
              //   underline: Container(
              //     height: 2,
              //     color: Colors.black,
              //   ),
              //   onChanged: ( newValue) {
              //     setState(() {
              //       dropdownValue = newValue!.name.toString();
              //     });
              //   },
              //   items: widget.coin
              //       ?.map<DropdownMenuItem<CoinItem>>((CoinItem value) {
              //     return DropdownMenuItem<CoinItem>(
              //
              //       child: Text(value.name.toString()),
              //     );
              //   }).toList(),
              // ),
              Container(

                child: DropdownSearch<CoinItem>(
                  items: widget.coin,
                  mode: Mode.MENU,
                  maxHeight: MediaQuery.of(context).size.height - 100,
                  validator: (u) => u == null ? "BitCoin is required " : null,


                  showSearchBox: true,
                  label: widget.coinItem!.name??"Select a Bitcoin",
                  itemAsString: (CoinItem? u) => u!.name!,
                  popupItemBuilder: _customPopupItemBuilderForDistrict,
                  dropdownSearchDecoration: InputDecoration(
                      hintText: "Enter City",
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black26,
                          width: 0.5,
                        ),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(8.0),
                        ),
                      ),
                      hintStyle: TextStyle(
                          fontSize: 15, color: Colors.black26),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black26, width: 0.5),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(8.0),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black26, width: 1.0),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(8.0),
                        ),
                      ),
                      contentPadding: EdgeInsets.only(left: 8.0)),
                  onChanged: (e) async {
                    dropdownValue=e!.name!;
                    setState(() {
                      price=e.current_price;
                      _counter.value=e.current_price!;
                    });

                    // addAddressModel.district = e!.id.toString();
                    // await store.getCity(e.id.toString());
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Number of Quantity",
                    style: TextStyle(
                      color: Colors.grey[400],
                      //    fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              ),
      // DropdownSearch<String>(
      //   validator: (v) => v == null ? "required field" : null,
      //   mode: Mode.MENU,
      //   dropdownSearchDecoration: InputDecoration(
      //     hintText: "Transaction Type",
      //     // labelText: "Menu mode *",
      //     filled: true,
      //     border: UnderlineInputBorder(
      //       borderSide: BorderSide(color: Color(0xFF01689A)),
      //     ),
      //   ),
      //   showAsSuffixIcons: true,
      //   clearButtonBuilder: (_) => Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: const Icon(
      //       Icons.clear,
      //       size: 24,
      //       color: Colors.black,
      //     ),
      //   ),
      //   dropdownButtonBuilder: (_) => Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: const Icon(
      //       Icons.arrow_drop_down,
      //       size: 24,
      //       color: Colors.black,
      //     ),
      //   ),
      //   showSelectedItems: true,
      //   items: [
      //    "Buy","Sell"
      //   ],
      //   showClearButton: false,
      //   onChanged: (e){
      //
      //   },
      //   popupItemDisabled: (String? s) =>
      //   s?.startsWith('I') ?? true,
      //   selectedItem: "",
      // ),
              Container(
                //height: 36
                child: TextFormField(
                  //maxLength: 10,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    LengthLimitingTextInputFormatter(10),

                  ],
                  textInputAction: TextInputAction.next,
                  controller: quantity,
                  autofocus: false,
                     onChanged: (e){
                    double a= double.parse(e);
                    double? s= price;
                    _counter.value=a*s!;

                  },
                  validator: (val) =>
                  val!.isEmpty || !val.contains("@")
                      ? "enter a valid eamil"
                      : null,

                  decoration: InputDecorations
                      .buildInputDecoration_1(
                    hint_text: "Number Of quantity",
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Purchase Price : ",
                        style: TextStyle(
                          color: Colors.grey[400],
                          //    fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        price.toString(),
                        style: TextStyle(
                          color: Colors.grey[400],
                          //    fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // DropdownSearch<String>(
              //   validator: (v) => v == null ? "required field" : null,
              //   mode: Mode.MENU,
              //   dropdownSearchDecoration: InputDecoration(
              //     hintText: "Transaction Type",
              //     // labelText: "Menu mode *",
              //     filled: true,
              //     border: UnderlineInputBorder(
              //       borderSide: BorderSide(color: Color(0xFF01689A)),
              //     ),
              //   ),
              //   showAsSuffixIcons: true,
              //   clearButtonBuilder: (_) => Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: const Icon(
              //       Icons.clear,
              //       size: 24,
              //       color: Colors.black,
              //     ),
              //   ),
              //   dropdownButtonBuilder: (_) => Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: const Icon(
              //       Icons.arrow_drop_down,
              //       size: 24,
              //       color: Colors.black,
              //     ),
              //   ),
              //   showSelectedItems: true,
              //   items: [
              //    "Buy","Sell"
              //   ],
              //   showClearButton: false,
              //   onChanged: (e){
              //
              //   },
              //   popupItemDisabled: (String? s) =>
              //   s?.startsWith('I') ?? true,
              //   selectedItem: "",
              // ),

              // Container(
              //   width: 300,
              //   child: TextFormField(
              //     controller: quantity,
              //     // obscureText: true,
              //     onChanged: (e){
              //       double a= double.parse(e);
              //       double? s= price;
              //       _counter.value=a*s!;
              //
              //     },
              //     decoration: InputDecoration(
              //         hintText: "1",
              //         hintStyle: TextStyle(
              //             color: Colors.black38
              //         ),
              //         labelText: "Quantity",
              //         labelStyle: TextStyle(
              //             color: Colors.black38
              //         )
              //     ),
              //   ),
              // ),
              // Text("Price"+price.toString()),
              ValueListenableBuilder<double>(
                builder: (BuildContext context, double value, Widget? child) {
                  // This builder will only get called when the _counter
                  // is updated.
                  return Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Total Price : ",
                            style: TextStyle(
                              color: Colors.grey[400],
                              //    fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "$value",
                            style: TextStyle(
                              color: Colors.grey[400],
                              //    fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                      ),

                      // Text('$value'),
                      child!,
                    ],
                  );
                },
                valueListenable: _counter,
                // The child parameter is most helpful if the child is
                // expensive to build and does not depend on the value from
                // the notifier.
                child: Text(""),
              ),
              // Container(
              //   width: 300,
              //   child: TextFormField(
              //     controller: amount,
              //     // obscureText: true,
              //     decoration: InputDecoration(
              //         hintText: "Enter your amount",
              //         hintStyle: TextStyle(
              //             color: Colors.black38
              //         ),
              //         labelText: "Coin Amount",
              //         labelStyle: TextStyle(
              //             color: Colors.black38
              //         )
              //     ),
              //   ),
              // ),


              MaterialButton(onPressed: ()async{
                if(totalValue.$ > _counter.value ){
                  await addCoin(dropdownValue, _counter.value.toString(),dropdownValue,"Buy",quantity.text,price.toString(),widget.coinItem!.image!);
                  await totalPurchase(dropdownValue, _counter.value.toString(),dropdownValue,"Buy",quantity.text,price.toString());
                  // await updateCoinForBuy(dropdownValue.toLowerCase(),price.toString());
                  // final totalvalue=totalValue.$ -_counter.value;


                  await buyCoin(_counter.value.toString()).whenComplete(() {
                    final snackBar = SnackBar(
                      content: const Text("Purchased SuccessFull"),
                      action: SnackBarAction(
                        label: "",
                        onPressed: () {
                          // Some code to undo the change.
                        },
                      ),
                    );

                    // Find the ScaffoldMessenger in the widget tree
                    // and use it to show a SnackBar.
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);

                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DashboardScreen()),
                  );
                }else{
                  final snackBar = SnackBar(
                    content: const Text('UnSufficient Amount'),
                    action: SnackBarAction(
                      label: 'Click To upload',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  );

                  // Find the ScaffoldMessenger in the widget tree
                  // and use it to show a SnackBar.
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);

                }



              },
                color :Colors.black54,
                child: Text("press to buy",style: TextStyle(color: Colors.white),),
              ),

            ],
          ),
        ),
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