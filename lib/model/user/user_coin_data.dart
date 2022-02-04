

import 'package:cloud_firestore/cloud_firestore.dart';

class UserCoinData{

static const amount="Amount";
static const Id="id";
static const Name="name";
static const Purchase_price="purchase_price";
static const Quantity="quantity";
static const Transaction_type="transaction_type";

String? Amount;
String? id;
String? name;
String? purchase_price;
String? quantity;
String? transaction_type;

UserCoinData({
  required this.Amount,
  required this.id,
  required this.purchase_price,
  required this.name,
  required this.transaction_type,
  required this.quantity,

});


//
// UserCoinData.fromSnapShot(DocumentSnapshot snapshot){
//   _Amount=snapshot[amount];
//   _name=snapshot[Name];
//   _purchase_price=snapshot[Purchase_price];
//   _quantity=snapshot[Quantity];
//   _transaction_type=snapshot[Transaction_type];
//   _id=snapshot.id;
// }
UserCoinData.fromJson(Map<String, Object?> json)
    : this(
  Amount: json['Amount']!  as String,
  id: json['id']! as String,
  purchase_price: json['purchase_price']! as String,
  name: json['name']! as String,
  transaction_type: json['transaction_type']! as String,
  quantity: json['quantity']! as String,

);




Map<String, Object?> toJson() {
  return {
    'Amount': Amount,
    'id': id,
    'purchase_price': purchase_price,
    'name': name,
    'transaction_type': transaction_type,
    'quantity': quantity,

  };
}


}

