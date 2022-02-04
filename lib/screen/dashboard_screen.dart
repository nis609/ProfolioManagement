import 'dart:io';



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:intl/intl.dart';
import 'package:profolio_management/helper/shared_value_helper.dart';
import 'package:profolio_management/res/size_config.dart';
import 'package:profolio_management/screen/home_screen.dart';
import 'package:profolio_management/screen/profile_picture.dart';
import 'package:profolio_management/screen/protfolio.dart';
import 'package:profolio_management/screen/registration_screen.dart';
import 'package:profolio_management/screen/sell_list.dart';
import 'package:profolio_management/screen/sell_page.dart';

import '../../main.dart';






enum WhyFarther { harder, smarter, selfStarter, tradingCharter }
class DashboardScreen extends StatefulWidget {
  final int? index;
  final int? totalTab;
  final int? categoryIndex;

  const DashboardScreen({Key? key, this.index, this.totalTab, this.categoryIndex}) : super(key: key);
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}
// final productByCategoryProvide =
// FutureProvider.autoDispose<HomeModel>((ref) {
//   return ref.watch(homeScreenProvider).getHomePagess();
// });
class _DashboardScreenState extends State<DashboardScreen> {
  PageController pageController = PageController();
  int currentIndex = 0;
  int pageIndex = 0;
  String a = "ss";
  late DateTime _selectedDate;
  int _selectedIndex = 0;
  List<dynamic> as=[];


  TextEditingController _searchEditingController = TextEditingController();

  bool scrollListener(ScrollNotification scrollInfo) {

    bool scroll = false;
    if (scrollInfo.metrics.axis == Axis.vertical) {
      if (scrollInfo.metrics.pixels > 30) {
        setState(() {
          a = "bb";
          _showAppBar=false;
         // _showAppBars=false;
        });
      } else {
        setState(() {
          a = "ss";
          _showAppBar=false;
          //_showAppBars=false;
        });
      };
      return scroll = true;
    }
    return scroll;
  }
@override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  @override
  void didUpdateWidget(covariant DashboardScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();



  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final width = SizeConfig.screenWidth;
    final height = SizeConfig.screenHeight;
    return WillPopScope(
      child: Container(

        child: SafeArea(
          top: true,

          child: Scaffold(
          //  drawer: NavDrawer(),

            bottomNavigationBar: BottomNavigationBar(
              // iconSize: 25,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              onTap:_onItemTapped ,


              currentIndex: _selectedIndex,

              selectedFontSize: 30,
              unselectedIconTheme: IconThemeData(
                color: Colors.black54,

              ),
              unselectedItemColor: Colors.black54,
              selectedIconTheme: IconThemeData(color: Colors.orange),
              selectedItemColor: Colors.orange,
              selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home,size: 25,),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(

                    Icons.category,
                    size: 25,
                  ),

                  label: 'Purchase List',

                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_sharp,size: 25,),
                  label: 'Sell list',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.admin_panel_settings_outlined,size: 25,
                  ),
                  label: 'Profile',
                ),
              ],
            ),

            body: NotificationListener<ScrollNotification>(
              onNotification: scrollListener,
              child: CustomScrollView(
                physics: NeverScrollableScrollPhysics(),


                slivers: [
                  // _showAppBar ==true ? Appbar(width!, "") : Appbar(
                  //     width!, ""),
                  // _showAppBar ==true ? Search(width, "") :   SliverList(delegate: SliverChildListDelegate([
                  //   SizedBox.shrink()
                  // ])),

                  // _showAppBars ==true ? NotificationAppbar(width, "") :   SliverList(delegate: SliverChildListDelegate([
                  //   SizedBox.shrink()
                  // ]))
                  SliverList(delegate: SliverChildListDelegate([
                    _dashBody(height!, width!)
                  ]))
                ],

              ),
            ),
          ),
        ),
      ),
      onWillPop: ()=>
        _exitApp(context)
      ,
    );
  }
  Future<bool> _exitApp(BuildContext context) async {
    SizeConfig().init(context);
    final width = SizeConfig.safeBlockHorizontal;
    final height = SizeConfig.safeBlockVertical;
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Are you sure you want to close \napplication?',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.6), fontSize: 14),
                ),
              ),
              _actionButton(context, height!, width!),
            ],
          ),
        ),
      ),
    );
    return true;
  }
  Widget _dashBody(double height, double width) {
    return Container(
      height: height,
      width: width,

      child:  IndexedStack(
        index: _selectedIndex,
        children: _pages,



      ),
    );
  }


  onPageChange(index) {
    setState(() {
      currentIndex = index;
      pageIndex = currentIndex;
    });
  }

  onTabChange(index) {
    setState(() {

      currentIndex = index;
      pageController.jumpToPage(index);
    });
  }
  TextEditingController dateinput = TextEditingController();


  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Videos',
      style: optionStyle,
    ),
    Text(
      'Index 2: Search',
      style: optionStyle,
    ),
    Text(
      'Index 3: About',
      style: optionStyle,
    ),
  ];
  final _formKey = GlobalKey<FormState>();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(is_logged_in.$);

    });
  }
  bool _showAppBar = false;
  bool _showAppBars = false;
    List<Widget> _pages = <Widget>[
      HomeScreen(),
      is_logged_in.$==true?ProtfolioScreen():RegistrationScreen(),
      is_logged_in.$==true?SellList():RegistrationScreen(),

      is_logged_in.$==true?ProfilePage():RegistrationScreen(),

  ];
  Widget Appbar(double width,String title){
    return  SliverAppBar(
      expandedHeight: width/8,
      floating: false,
      pinned: true,
      toolbarHeight: 50,
      iconTheme: IconThemeData(color: Colors.purple),


      //backgroundColor: AppColor.appNameThemeColor,

      // flexibleSpace: FlexibleSpaceBar(
      //   centerTitle: true,
      //
      //   title: Text("Purnapaath",
      //       style: TextStyle(
      //         color: Colors.white,
      //         fontSize: 16.0,
      //       )),
      //   background: Image.network(
      //     "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
      //     fit: BoxFit.cover,
      //   )
      // ),
      actions: [
        IconButton(
          icon: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: Colors.grey[200]!
                  ),
                  shape: BoxShape.circle
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Icon(Icons.search,size: 20,),
              )),

        onPressed: ()  {
          setState(() {
            _showAppBar = !_showAppBar;
            _showAppBars=false;
          });
        },

        ),
        IconButton(
          icon: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: Colors.grey[200]!
                  ),
                  shape: BoxShape.circle
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Icon(Icons.add_alert,size: 20,),
              )),
          onPressed: ()  {
            setState(() {
              _showAppBars = !_showAppBars;
              _showAppBar=false;

            });
          },

            // _onShare(context,widget.url,
        )

      ],
      flexibleSpace: Stack(
        children: <Widget>[
          Positioned.fill(
              child:Text(title)
          ),
          // Positioned.fill(
          //   child: Align(
          //     alignment: Alignment.bottomCenter,
          //     child: Padding(
          //       padding: const EdgeInsets.only(bottom: 8.0),
          //       child: Image.asset("assets/applogo.png"),
          //     ),
          //   ),
          // ),
        ],
      ),
    );

  }






  Widget _actionButton(BuildContext context, double height, double width) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: height * 6,
              width: height *15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(4),
                    bottomRight: Radius.circular(4)),
                color: Colors.grey.shade300,
              ),
              child: Center(
                  child: Text("Cancel",style: TextStyle(color:Colors.black87),)
              ),
            ),
          ),
        ),
        InkWell(
          onTap: (){
            if (Platform.isAndroid) {
              SystemNavigator.pop();
            } else if (Platform.isIOS) {
              exit(0);
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: height * 6,
              width: height * 15 ,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    bottomLeft: Radius.circular(4)),
                color: Colors.blue.shade200,
              ),
              child: Center(
                  child: Text("Confirm",style: TextStyle(color:Colors.black),)
              ),
            ),
          ),
        ),

      ],
    );
  }

  Widget buttonSpecific(double height, Function function, Color buttonColor,
      String text, Color textColor) {
    return Flexible(
      child: InkWell(
        // onTap: function,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: height * 6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(4),
                  bottomRight: Radius.circular(4)),
              color: buttonColor,
            ),
            child: Center(
              child: Text("text",style: TextStyle(height: height,color: textColor),)
            ),
          ),
        ),
      ),
    );
  }
}
