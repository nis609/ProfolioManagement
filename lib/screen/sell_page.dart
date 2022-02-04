
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:profolio_management/custom/input_decorations.dart';
import 'package:profolio_management/helper/flutterfire.dart';
import 'package:profolio_management/helper/shared_value_helper.dart';
import 'package:profolio_management/model/coin_data/coin_item.dart';
import 'package:profolio_management/screen/dashboard_screen.dart';

class SellView extends StatefulWidget {
  final String? id;
  final double? Amount;
  final double? current_price;
  final double? purchasePrice;
final int? quantity;
final String? transaction_type;
final String? name;
final String? image;
  SellView({Key? key,this.id, this.Amount, this.current_price,this.purchasePrice, this.quantity, this.transaction_type, this.name,this.image}) : super(key: key);

  @override
  _SellViewState createState() => _SellViewState();
}

class _SellViewState extends State<SellView> {
  List<String> coins=[
  ];
  String dropdownValue="bittcoin";
  String transactionType="";
  TextEditingController amount= TextEditingController();
  TextEditingController quantity= TextEditingController();
  double? price;
  double? currentPrice;
  final ValueNotifier<double> priceDiffernce = ValueNotifier<double>(0);
  @override
  void initState() {
    // TODO: implement initState
    coins=[
      "bitcoin",
      "ether",
      "Dodg",
      "tether"
    ];

    currentPrice=widget.current_price;
    price =widget.purchasePrice;

    dropdownValue=widget.name.toString();
    priceDiffernce.value= currentPrice!-price!;

    print(dropdownValue);

  }
  final ValueNotifier<double> _counter = ValueNotifier<double>(0);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 700,
      width: 500,
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.black45,
        title: Text("Sell Coins"),
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Coin Name : ",
                        style: TextStyle(
                          color: Colors.grey,
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
                        widget.name.toString(),
                        style: TextStyle(
                          color: Colors.black87,
                          //    fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ),
                ],
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
                          color: Colors.grey,
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
                          color:Colors.black87,
                          //    fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Current Price: ",
                        style: TextStyle(
                          color: Colors.grey,
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
                        currentPrice.toString(),
                        style: TextStyle(
                          color: Colors.black87,
                          //    fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Price Difference: ",
                        style: TextStyle(
                          color: Colors.grey,
                          //    fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: ValueListenableBuilder<double>(
                        builder: (BuildContext context, double value, Widget? child) {
                          // This builder will only get called when the _counter
                          // is updated.
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text('$value'),
                              child!,
                            ],
                          );
                        },
                        valueListenable: priceDiffernce,
                        // The child parameter is most helpful if the child is
                        // expensive to build and does not depend on the value from
                        // the notifier.
                        child: Text(""),
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Quanitity ${ widget.quantity}",
                    style: TextStyle(
                      color: Colors.grey,
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
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Price Difference: ",
                        style: TextStyle(
                          color: Colors.grey,
                          //    fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: ValueListenableBuilder<double>(
                        builder: (BuildContext context, double value, Widget? child) {
                          // This builder will only get called when the _counter
                          // is updated.
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text('$value'),
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
                    ),
                  ),
                ],
              ),
              // ValueListenableBuilder<double>(
              //   builder: (BuildContext context, double value, Widget? child) {
              //     // This builder will only get called when the _counter
              //     // is updated.
              //     return Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //       children: <Widget>[
              //         Text('$value'),
              //         child!,
              //       ],
              //     );
              //   },
              //   valueListenable: _counter,
              //   // The child parameter is most helpful if the child is
              //   // expensive to build and does not depend on the value from
              //   // the notifier.
              //   child: Text(""),
              // ),
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
                double totalQuanity=double.parse(quantity.text.toString());
                int? q=widget.quantity;
                if(totalQuanity>q!){
                  const snackBar = SnackBar(
                    content: Text('u dont have enough quantity'),
                  );


                  ScaffoldMessenger.of(context).showSnackBar(snackBar);

                }else{
                  await sellCoin(dropdownValue, _counter.value.toString(),dropdownValue,"Sell",quantity.text,price.toString(),widget.image!);
                  await addCoin(dropdownValue, _counter.value.toString(),dropdownValue,"Sell",quantity.text,price.toString(),widget.image!);
                  await Sales(dropdownValue, _counter.value.toString(),dropdownValue,"Sell",quantity.text,price.toString());
                  // final totalvalue=totalValue.$ -_counter.value;
                  await updateWallet(_counter.value.toString(),"0").whenComplete(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardScreen()),
                    );
                  });
                }

                const snackBar = SnackBar(
                  content: Text('Sucecssfully Sold'),
                );


                ScaffoldMessenger.of(context).showSnackBar(snackBar);

              },
                color :Colors.red,
                child: Text("Sell",style: TextStyle(color: Colors.white),),
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