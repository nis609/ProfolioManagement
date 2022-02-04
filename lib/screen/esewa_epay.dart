import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:profolio_management/screen/dashboard_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../helper/flutterfire.dart';

class EsewaEpay extends StatefulWidget {
  final double? amount;

  const EsewaEpay({Key? key, this.amount}) : super(key: key);
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<EsewaEpay> {
  Completer<WebViewController> _controller = Completer<WebViewController>();

  late WebViewController _webViewController;

  String testUrl = "https://www.google.com/";

  _loadHTMLfromAsset() async {
    String file = await rootBundle.loadString("assets/epay_request.html");
    _webViewController.loadUrl(Uri.dataFromString(file,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }

  // ePay deatils
  double tAmt = 800;
  double amt = 800;
  double txAmt = 0;
  double psc = 0;
  double pdc = 0;
  String scd = "EPAYTEST";
  String su = "https://github.com/kaledai";
  String fu = "https://refactoring.guru/design-patterns/factory-method";

  @override
  void initState() {
    super.initState();
    print(widget.amount);
    tAmt=widget.amount!;
    amt=widget.amount!;
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     setState(() {
      //       String pid = UniqueKey().toString();
      //       _webViewController.evaluateJavascript(
      //           'requestPayment(tAmt = $tAmt, amt = $amt, txAmt = $txAmt, psc = $psc, pdc = $pdc, scd = "$scd", pid = "$pid", su = "$su", fu = "$fu")');
      //     });
      //   },
      //   child: Icon(Icons.add),
      // ),
      appBar: AppBar(
        backgroundColor: Colors.black45,
        leading: SizedBox.shrink(),
      ),
      body: WebView(
        initialUrl:  "about:blank",
        javascriptMode: JavascriptMode.unrestricted,
        javascriptChannels: Set.from([
          JavascriptChannel(
            name: "message",
            onMessageReceived: (message) {},
          ),
        ]),
        onPageFinished: (data) async{
          setState(() {
            String pid = UniqueKey().toString();
            _webViewController.evaluateJavascript(
                'requestPayment(tAmt = $tAmt, amt = $amt, txAmt = $txAmt, psc = $psc, pdc = $pdc, scd = "$scd", pid = "$pid", su = "$su", fu = "$fu")');
          });
          if (data.toLowerCase().contains("https://github.com/kaledai")) {
            await addWallet(tAmt.toString(),tAmt.toString());
            await  Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DashboardScreen(),
              ),
            );
          }
          else if (data.toLowerCase().contains("https://refactoring.guru/design-patterns/factory-method")==true) {
            await  Navigator.pushNamed(context, '/check');
            //await Navigator.pop(context);
          } ;
        },
        onWebViewCreated: (webViewController) {
           // _controller.complete(webViewController);
          _webViewController = webViewController;
          _loadHTMLfromAsset();
        },
      ),
    );
  }
}
