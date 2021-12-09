import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'buttomNavigationBar.dart';
import 'SignupPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Global.dart';
import 'subscription.dart';




  class LoginPage extends StatefulWidget {



    @override
    _LoginPageState createState() => _LoginPageState();
  }

  class _LoginPageState extends State<LoginPage> {
    final formKey = GlobalKey<FormState>();
    TextEditingController passwordController = new TextEditingController();
    TextEditingController emailController = new TextEditingController();


    @override
    Widget build(BuildContext context) {
      return WillPopScope(
        onWillPop: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Subscription()));},
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Subscription()));
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.black,
              ),
            ),

          ),
          body: Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:<Widget>[
                    Expanded(
                        child:Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children:<Widget>[
                              Column(
                                children: <Widget>[
                                  Text('Login',style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                  SizedBox(height: 10,),
                                  Text('Login to your account',style: TextStyle(
                                    fontSize: 15,
                                    color:Colors.grey[700],
                                  ),),
                                ],
                              ),
                              Padding(
                                padding:EdgeInsets.symmetric(horizontal: 40),
                                child: Column(
                                  children: <Widget>[
                                Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Email',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    SizedBox(height: 5),

                                    TextFormField(
                                      controller: emailController,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.email),
                                        contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.grey[400],
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.grey[400],
                                          ),
                                        ),
                                      ),

                                      onSaved: (String value){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => ButtomNavBar()));
                                      },
                                    ),
                                    SizedBox(height: 10,),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Password',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    SizedBox(height: 5),

                                    TextFormField(
                                      controller: passwordController,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.lock_open),
                                        contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.grey[400],
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.grey[400],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                  ],
                                ),

                                  ],
                                ),
                              ),
                              Padding(
                                padding:EdgeInsets.symmetric(horizontal: 40),
                                child: Container(
                                  padding: EdgeInsets.only(top: 1,left: 1),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border(
                                      bottom: BorderSide(color: Colors.black),
                                      top: BorderSide(color: Colors.black),
                                      left: BorderSide(color: Colors.black),
                                      right: BorderSide(color: Colors.black),
                                    ),
                                  ),
                                  child: MaterialButton(
                                      minWidth: double.infinity,
                                      height: 60,
                                      color: Color(0xff0095FF),
                                      onPressed:  (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ButtomNavBar()));
                                      },
                                      // async {
                                      //
                                      //   final response = await http.post(
                                      //     Uri.parse("http://192.168.43.135:5002/users/login"),
                                      //     headers : <String , String>{
                                      //       'Content-Type' : 'application/json; charset=UTF-8'
                                      //
                                      //     },
                                      //     body : jsonEncode(<String , String>{
                                      //       'email' : emailController.text,
                                      //       'password' : passwordController.text,
                                      //     })
                                      //   );
                                      //   if(response.statusCode == 200){
                                      //     String data= response.body;
                                      //     var decodedData = jsonDecode(data);
                                      //     print(decodedData);
                                      //     myGlobal().setemail(decodedData['data']['email']);
                                      //     myGlobal().setFirstName(decodedData['data']['first_name']);
                                      //     myGlobal().setLastName(decodedData['data']['last_name']);
                                      //     myGlobal().setPassword("decodedData.data.first_name");
                                      //     myGlobal().setPhoto(decodedData['data']['photo']);
                                      //     myGlobal().setId(decodedData['data']['userid']);
                                      //     //myGlobal().getemail();
                                      //    Navigator.push(context, MaterialPageRoute(builder: (context)=>ButtomNavBar()));
                                      //     }
                                      //   else if(response.statusCode == 400){
                                      //     print(response.body);
                                      //   }
                                      //
                                      // },
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Text('Login',style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),),
                                  ),
                                ),
                              ),
                              SizedBox(height: 15,),
                              InkWell(
                                child: Text('Forgot password?',style: TextStyle(
                                  color: Colors.red,
                                ),),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("Don't have an account?"),
                                  SizedBox(width: 10,),
                                  InkWell(
                                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()));},
                                    child: Text('Sign Up',style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      color: Color(0xff0095FF),
                                    ),),
                                  )

                                ],
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 100),
                                height: 180,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image:AssetImage("asset/image/Login.png"),
                                      fit: BoxFit.fitHeight,
                                    )
                                ),
                              )

                            ]
                        )
                    )
                  ]
              )
          ),
        ),
      );
    }
  }






