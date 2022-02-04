import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:profolio_management/helper/shared_value_helper.dart';
import 'package:profolio_management/res/size_config.dart';
import 'package:profolio_management/screen/dashboard_screen.dart';

class ProfilePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('users').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Error'),
          );
        } else if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (ctx, index) {
              if(snapshot.data!.docs[index]['id']==access_token.$){
                final profile =snapshot.data!.docs[index];
                return Container(
                  height: SizeConfig.screenHeight,
                  width: SizeConfig.screenWidth,
                  child: Scaffold(

                    appBar: AppBar(
                      elevation: 0.0,
                      automaticallyImplyLeading: false,
                      backgroundColor: Color(0xff555555),
                      actions: [
                        IconButton(
                          icon: Icon(
                            Icons.logout,
                            color: Colors.white,
                          ),
                          onPressed: () {
                              is_logged_in.$=false;
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const DashboardScreen()),
                              );

                              final snackBar = SnackBar(
                                  content: const Text('Logout SucessFull'),
                              action: SnackBarAction(
                              label: '',
                              onPressed: () {
                              // Some code to undo the change.
                              },
                              )
                              );

                              // Find the ScaffoldMessenger in the widget tree
                              // and use it to show a SnackBar.
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          },
                        ),
                      ],
                    ),
                    body: Stack(
                      alignment: Alignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height : SizeConfig.screenHeight,
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Row(children: [
                                      Expanded(child: Text("Name :",style: TextStyle(fontSize: 18),),flex: 1,),
                                      Expanded(child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(profile['name'],style: TextStyle(fontSize: 18),)),flex: 4,)
                                    ],),
                                  ),
                                  Padding(

                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Row(children: [
                                      Expanded(child: Text("Email :",style: TextStyle(fontSize: 18),),flex: 1,),
                                      Expanded(child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(profile['email'],style: TextStyle(fontSize: 18),)),flex: 4,)
                                    ],),
                                  ),
                                  profile['phone']==null?SizedBox.shrink():Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Row(children: [
                                      Expanded(child: Text("phone :",style: TextStyle(fontSize: 18),),flex: 1,),
                                      Expanded(child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(profile['phone'].toString(),style: TextStyle(fontSize: 18),)),flex: 4,)
                                    ],),
                                  ),

                                  // MaterialButton(onPressed:()async{
                                  //   print("asdasd");
                                  //   is_logged_in.$=false;
                                  //
                                  //   final snackBar = SnackBar(
                                  //       content: const Text('Logout SucessFull'),
                                  //   action: SnackBarAction(
                                  //   label: '',
                                  //   onPressed: () {
                                  //   // Some code to undo the change.
                                  //   },
                                  //   )
                                  //   );
                                  //
                                  //   // Find the ScaffoldMessenger in the widget tree
                                  //   // and use it to show a SnackBar.
                                  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  // },
                                  //
                                  //   child: Text("Logout",style: TextStyle(color:Colors.white),),
                                  //   color: Colors.black45,
                                  //
                                  // )
                                ],
                              ),
                            )
                          ],
                        ),
                        CustomPaint(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                          ),
                          painter: HeaderCurvedContainer(),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                "Profile",
                                style: TextStyle(
                                  fontSize: 35,
                                  letterSpacing: 1.5,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10.0),
                              width: MediaQuery.of(context).size.width / 2,
                              height: MediaQuery.of(context).size.width / 2,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white, width: 5),
                                shape: BoxShape.circle,
                                color: Colors.white,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(profile['photo']),
                                ),
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                );
              }else{
                return SizedBox.shrink();
              }

            },
          ); ;
        }
      },
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xff555555),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 450,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Container(
                      height: 55,
                      width: double.infinity,
                      child: RaisedButton(
                        onPressed: () {},
                        color: Colors.black54,
                        child: Center(
                          child: Text(
                            "Update",
                            style: TextStyle(
                              fontSize: 23,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          CustomPaint(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            painter: HeaderCurvedContainer(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 35,
                    letterSpacing: 1.5,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 5),
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/profile.png'),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 270, left: 184),
            child: CircleAvatar(
              backgroundColor: Colors.black54,
              child: IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Color(0xff555555);
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}