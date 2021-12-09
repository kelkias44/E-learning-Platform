import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'buttomNavigationBar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Global.dart';
import 'subscription.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  TextEditingController firstnamecontroller = new TextEditingController();
  TextEditingController lastnamecontroller = new TextEditingController();
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  TextEditingController confirmPasswordcontroller = new TextEditingController();
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Subscription()));},
      child: Scaffold(
        resizeToAvoidBottomInset: true,
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
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            height: MediaQuery.of(context).size.height - 20,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Create an account, it's free",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'First Name ',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 5),

                        TextFormField(
                          obscureText: false,
                          controller: firstnamecontroller,
                          decoration: InputDecoration(
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Last Name ',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 5),

                        TextFormField(
                          obscureText: false,
                          controller: lastnamecontroller,
                          decoration: InputDecoration(
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
                    Column(
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
                              controller : emailcontroller,
                              obscureText: false,
                              decoration: InputDecoration(
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
                          controller : passwordcontroller,
                          obscureText: true,
                          decoration: InputDecoration(
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Confirm Password',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 5),

                        TextFormField(
                          controller : confirmPasswordcontroller,
                          obscureText: true,
                          decoration: InputDecoration(
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
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ButtomNavBar()));
                        },
                        // async {
                        //
                        //
                        //   final response = await http.post(
                        //       Uri.parse("http://192.168.43.135:5002/users/signup"),
                        //       headers : <String , String>{
                        //         'Content-Type' : 'application/json; charset=UTF-8'
                        //
                        //       },
                        //       body : jsonEncode(<String , String>{
                        //         'first_name' : firstnamecontroller.text,
                        //         'last_name' : lastnamecontroller.text,
                        //         'email' : emailcontroller.text,
                        //         'password' : passwordcontroller.text,
                        //         'confirmPassword' :  passwordcontroller.text
                        //
                        //       })
                        //   );
                        //   if(response.statusCode == 200){
                        //     String data= response.body;
                        //     var decodedData = jsonDecode(data);
                        //     print(decodedData);
                        //     myGlobal().setemail( emailcontroller.text);
                        //     myGlobal().setFirstName(firstnamecontroller.text);
                        //     myGlobal().setLastName(lastnamecontroller.text);
                        //     myGlobal().setPassword(passwordcontroller.text);
                        //     myGlobal().setPhoto("profilePic.png");
                        //     //myGlobal().getemail();
                        //     Navigator.push(context, MaterialPageRoute(builder: (context) => ButtomNavBar()));
                        //   }
                        //   else if(response.statusCode == 400){
                        //     Text(response.body);
                        //     print(response.body);
                        //   }
                        //
                        // },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text('Sign Up',style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white,
                        ),)
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Already have an account?'),
                    SizedBox(width: 10,),
                    InkWell(
                      onTap: () {

                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));


                      },
                      child: Text('Login',style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Color(0xff0095FF),
                      ),)
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      );

  }
}
