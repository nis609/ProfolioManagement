import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:profolio_management/helper/shared_value_helper.dart';
import 'package:profolio_management/model/user/user_coin_data.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../helper/flutterfire.dart';

class AppProvider with ChangeNotifier{
  FirebaseAuth firebaseAuth =FirebaseAuth.instance;
  List<UserCoinData> userdatas=[];
  FirebaseFirestore firestore =FirebaseFirestore.instance;

  AppProvider.initialize(){
    getusertrnscation();
  }
  final storage = new FlutterSecureStorage();
  Future<UserCredential?> signInWithGoogle()async{
    final GoogleSignInAccount? googleSignInAccount =
     await   GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleSignInAuthentication =
        await googleSignInAccount?.authentication;

    final credtional =GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication?.accessToken,
      idToken: googleSignInAuthentication?.idToken

    );
    print(credtional);
    print("asdasd");

    return await firebaseAuth?.signInWithCredential(credtional).then((value) async {

      access_token.$=value.user?.uid;
      is_logged_in.$=true;
      print(is_logged_in.$);
      print(access_token.$);
      firestore.collection('users').doc(value.user?.uid).set({
        "id":value.user?.uid,
        "name":value.user?.displayName,
        "email":value.user?.email,
        "phone":value.user?.phoneNumber,
        "photo":value.user?.photoURL
      });
      await addWallet("0","0");
    });
  }

 fetchAllContact() {




  }
getusertrnscation(){
    return firestore.collection('users').withConverter<UserCoinData>(
      fromFirestore: (snapshots, _) => UserCoinData.fromJson(snapshots.data()!),
      toFirestore: (movie, _) => movie.toJson(),
    );



  }

  // getUs() async{
  //   userdatas = await getusertrnscation();
  //
  // }

}