import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<bool> signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}

Future<bool> register(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
    return false;
  } catch (e) {
    print(e.toString());
    return false;
  }
}

Future<bool> addCoin(String id, String amount,String name,String transaction_type,String quantity,String price,String image) async {
  try {
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    var totalAmount = double.parse(amount);
    var totalquantity = int.parse(quantity);
    var current_price = double.parse(price);


    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('Coins')
        .doc(uid)
        .collection('Buy')
        .doc(name.toLowerCase());
    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(documentReference);
      if (!snapshot.exists) {
        documentReference.set({'Amount': totalAmount,
          'id':id,
          'name':name,
          'transaction_type':"Buy",
          'image':image,
          'quantity':totalquantity,
          'purchase_price':current_price,

        });
        return true;
      }
      double? newAmount;
      int? newquantity;
      if(transaction_type=="Sell"){
        newAmount= snapshot['Amount'] - totalAmount;
        newquantity= snapshot['quantity'] - totalquantity;

      }else{
        newAmount= snapshot['Amount'] + totalAmount;
        newquantity= snapshot['quantity'] + totalquantity;
      }



      transaction.update(documentReference, {
        'id':id,
        'name':name,
        'transaction_type':transaction_type,
        'image':image,
        'quantity':newquantity,
        'purchase_price':current_price,
        'Amount': newAmount});
      return true;
    });
    return true;
  } catch (e) {
    return false;
  }
}
Future<bool> totalPurchase(String id, String amount,String name,String transaction_type,String quantity,String price) async {
  try {
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    var totalAmount = double.parse(amount);
    var totalquantity = int.parse(quantity);
    var current_price = double.parse(price);


    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('Coins')
        .doc(uid)
        .collection('TotalPurchase')
        .doc('Buy');
    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(documentReference);
      if (!snapshot.exists) {
        documentReference.set({'Amount': totalAmount,
          'id':id,


        });
        return true;
      }
      double? newAmount;
      int? newquantity;

        newAmount= snapshot['Amount'] + totalAmount;
        newquantity= snapshot['quantity'] + totalquantity;




      transaction.update(documentReference, {
        'id':id,

        'Amount': newAmount});
      return true;
    });
    return true;
  } catch (e) {
    return false;
  }
}
Future<bool> Sales(String id, String amount,String name,String transaction_type,String quantity,String price) async {
  try {
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    var totalAmount = double.parse(amount);
    var totalquantity = int.parse(quantity);
    var current_price = double.parse(price);


    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('Coins')
        .doc(uid)
        .collection('TotalSales')
        .doc('Sales');
    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(documentReference);
      if (!snapshot.exists) {
        documentReference.set({'Amount': totalAmount,
          'id':id,


        });
        return true;
      }
      double? newAmount;
      int? newquantity;

      newAmount= snapshot['Amount'] + totalAmount;
      newquantity= snapshot['quantity'] + totalquantity;




      transaction.update(documentReference, {
        'id':id,

        'Amount': newAmount});
      return true;
    });
    return true;
  } catch (e) {
    return false;
  }
}

Future<bool> updateCoin(String name,String price) async {
  try {
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    String? uids = FirebaseAuth.instance.currentUser?.uid;
    // var totalAmount = double.parse(amount);
    // var totalquantity = int.parse(quantity);
    var current_price = double.parse(price);


    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('Coins')
        .doc(uid)
        .collection('Sell')
        .doc(name.toLowerCase());
    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(documentReference);
      // if (!snapshot.exists) {
      //   documentReference.set({
      //
      //     'name':name,
      //
      //     'current_price':current_price,
      //
      //   });
      //   return true;
      // }
      // double? newAmount;
      // double? newquantity;




      transaction.update(documentReference, {

        'name':name,

        'current_price':current_price,

      });
      return true;
    });
    return true;
  } catch (e) {
    return false;
  }
}
Future<bool> updateCoinForBuy(String name,String price) async {
  try {
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    String? uids = FirebaseAuth.instance.currentUser?.uid;
    // var totalAmount = double.parse(amount);
    // var totalquantity = int.parse(quantity);
    var current_price = double.parse(price);


    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('Coins')
        .doc(uid)
        .collection('Buy')
        .doc(name.toLowerCase());
    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(documentReference);
      // if (!snapshot.exists) {
      //   documentReference.set({
      //
      //     'name':name,
      //
      //     'current_price':current_price,
      //
      //   });
      //   return true;
      // }
      // double? newAmount;
      // double? newquantity;




      transaction.update(documentReference, {

        'name':name.toLowerCase(),

        'current_price':current_price,

      });
      return true;
    });
    return true;
  } catch (e) {
    return false;
  }
}
Future<bool> sellCoin(String id, String amount,String name,String transaction_type,String quantity,String price,String ? image) async {
  try {
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    var totalAmount = double.parse(amount);
    var totalquantity = int.parse(quantity);
    var current_price = double.parse(price);

    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('Coins')
        .doc(uid)
        .collection('Sell')
        .doc(name.toLowerCase());
    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(documentReference);
      if (!snapshot.exists) {
        documentReference.set({'Amount': totalAmount,
          'id':id,
          'name':name,
          'transaction_type':transaction_type,
          'image':image,
          'quantity':totalquantity,
          'purchase_price':current_price,

        });
        return true;
      }

      double newAmount = snapshot['Amount'] + totalAmount;
      print(newAmount);
      int newquanity= snapshot['quantity'] + totalquantity;
      print(newAmount);

      transaction.update(documentReference, {
        'id':id,
        'name':name,
        'transaction_type':transaction_type,
        'image':image,
        'quantity':newquanity,
        'purchase_price':current_price,
        'Amount': newAmount});
      return true;
    });
    return true;
  } catch (e) {
    return false;
  }
}

Future<bool> addWallet( String amount,String totalInvesment) async {
  try {
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    var value = double.parse(amount);
    var totalValue = double.parse(totalInvesment);
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('Wallet')
        .doc(uid);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(documentReference);
      if (!snapshot.exists) {
        documentReference.set({'Amount': value,
          'id':uid,
          'total_investment':totalValue,


        });
        return true;
      }
      double newAmount = snapshot['Amount'] + value;
      double newInvestment = snapshot['total_investment'] + value;
      transaction.update(documentReference, {
        'id':uid,

        'Amount': newAmount,
        'total_investment': newInvestment
      });
      return true;
    });
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}
Future<bool> buyCoin( String amount) async {
  try {
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    var value = double.parse(amount);
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('Wallet')
        .doc(uid);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(documentReference);
      if (!snapshot.exists) {
        documentReference.set({'Amount': value,
          'id':uid,


        });
        return true;
      }
      double newAmount = snapshot['Amount'] - value;
      transaction.update(documentReference, {
        'id':uid,

        'Amount': newAmount
      });
      return true;
    });
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}
Future<bool> updateWallet( String amount,String totalInvestment) async {
  try {
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    var value = double.parse(amount);
    var totalValue = double.parse(totalInvestment);
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('Wallet')
        .doc(uid);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(documentReference);
      if (!snapshot.exists) {
        documentReference.set({'Amount': value,
          'id':uid,
          'total_investment':totalValue


        });
        return true;
      }
      double newAmount = snapshot['Amount'] + value;
      double totalInvestment = snapshot['total_investment'] + totalValue;
      transaction.update(documentReference, {
        'id':uid,

        'Amount': newAmount,
        'total_investment': totalInvestment
      });
      return true;
    });
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}
Future<bool> removeCoin(String id) async {
  String? uid = FirebaseAuth.instance.currentUser?.uid;
  FirebaseFirestore.instance
      .collection('Users')
      .doc(uid)
      .collection('Coins')
      .doc(id)
      .delete();
  return true;
}
