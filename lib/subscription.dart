import 'package:ew_app/LoginPage.dart';
import 'package:ew_app/SignupPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Subscription extends StatefulWidget {


  @override
  _SubscriptionState createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  Future<bool> onBackPress(){
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Are you sure?"),
            content: Text("You are gonig to exit the application!!"),
            actions: <Widget>[
              FlatButton(
                  onPressed: (){
                    Navigator.of(context).pop(false);
                  },
                  child: Text('No')),
              FlatButton(onPressed: (){
                SystemNavigator.pop();
              },
                  child: Text('Yes')),
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPress,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 30,vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text('Welcome',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),),
                    SizedBox(height: 20,),
                    Text('Ewket provides tutorials with excellent professionals.Do subscribe!',
                    textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height/3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("asset/image/welcome.png"),
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                      },
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text('Login',style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),),
                    ),
                    SizedBox(height: 20,),
                    MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      color: Color(0xff0095FF),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()));
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text('Signup',style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),),
                    ),
                  ],
                ),
              ],
            ),
          ),

        ),
      ),
    );
  }
}
