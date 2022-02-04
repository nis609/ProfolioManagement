import 'dart:async';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:progress_indicators/progress_indicators.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'dashboard_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
as();


  }
  as(){
    Timer(const Duration(seconds: 5), () async {


      Navigator.push(context, MaterialPageRoute(builder: (context){
        return DashboardScreen(

        );
      }));

    });
  }
  final _totalDots = 5;
  double _currentPosition = 0.0;

  double _validPosition(double position) {
    if (position >= _totalDots) return 0;
    if (position < 0) return _totalDots - 1.0;
    return position;
  }

  void _updatePosition(double position) {
    setState(() => _currentPosition = _validPosition(position));
  }
  String getCurrentPositionPretty() {
    return (_currentPosition + 1.0).toStringAsPrecision(2);
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Divider(
            color: Colors.transparent,
          ),
          GlowingProgressIndicator(
            child:  Image.asset("assets/coin.png",height: 250,width: 250,),
          ),

      SpinKitThreeBounce(
        duration: Duration(
          milliseconds: 2000
        ),
        size: 40,


        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: DecoratedBox(


              decoration: BoxDecoration(
                shape: BoxShape.circle,


                color: index.isEven ? Colors.black54 : Colors.black54,
              ),
            ),
          );
        },
      )
        ],
      ),
    );
  }
}