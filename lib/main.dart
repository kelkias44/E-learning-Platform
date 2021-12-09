import 'dart:async';

import 'package:ew_app/route_generator.dart';
import 'package:flutter/material.dart';
import 'MainPage.dart';
import 'onBoarding.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Avenir',
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/myHomePage',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
class MyHomePage extends StatefulWidget {
  

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => onBoarding()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffff5954),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text("Ewket",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    height: 3,
                  ),),
                ),
                Container(
                  child: Text("Learn anything from anywhere",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.w500,
                      height: 1,
                    ),),
                )
              ],
            ),
          ),
            Stack(
              children: <Widget>[
                Container(
                  alignment: Alignment.bottomCenter,
                  height: MediaQuery.of(context).size.height*0.6,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('asset/image/front.png'),
                      fit: BoxFit.cover,
                    )
                  ),
                ),
                Positioned(
                    bottom:50,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      )
                    )
                )
              ],
            )
        ],
      ),
    );
  }
  void openMainPage(){
    Navigator.pushNamed(context, '/subscription');
  }
}

