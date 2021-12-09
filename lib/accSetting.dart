import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ew_app/EditProfile.dart';
import 'LoginPage.dart';
import 'buttomNavigationBar.dart';
import 'Global.dart';

class accSetting extends StatefulWidget {
  static const rouName = '/accsetting';



  @override
  _accSettingState createState() => _accSettingState();
}

class _accSettingState extends State<accSetting> {

  bool showPassword = false;
  @override

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=>ButtomNavBar()));},
      child: Scaffold(
          backgroundColor: Color(0xfff4f6fd),
        appBar: AppBar(
          backgroundColor: Color(0xfff4f6fd).withOpacity(0.8),
          leading: IconButton(
            onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ButtomNavBar()));},
            icon: Icon(
                Icons.arrow_back_ios,
                color:Colors.black54,
            ),
          ),
          actions: [
            IconButton(
                onPressed: (){
                  settingsModalButtomSheet(context);
                },
                icon: Icon(
                  Icons.settings,
                    color:Colors.black54,
                ))
          ],
        ),
        body: Container(
          padding: EdgeInsets.only(left: 16, top: 25, right: 16),
          child: ListView(
            children: [

              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('asset/image/learning.png'),
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              buiTextField("Fullname","Kelkias Emana" , false),
              buiTextField("Email", "kelkiasemana@gmail.com", false),
              buiTextField("Password", "password", true),
              SizedBox(height: 15,),
              // InkWell(
              //   onTap: () => Navigator.of(context).push(new MaterialPageRoute(
              //     builder: (context) => new EditProfile())),
              //   child: Text('Edit profile',style: TextStyle(
              //     fontSize: 15,
              //     fontWeight: FontWeight.w200,
              //   ),
              //   ),
              // ),


            ],
          ),
        ),
      ),
    );
  }

  Widget buiTextField(String lText,String pHolder,bool ifPassword) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 35.0),
    child: TextField(
      obscureText: ifPassword ? showPassword : false,
      decoration: InputDecoration(
        suffixIcon: ifPassword
            ? IconButton(
          onPressed: () {
            setState(
                  () {
                showPassword = !showPassword;
              },
            );
          },
          icon: Icon(
            Icons.remove_red_eye,
            color: Colors.lightBlue,
          ),
        ) : null,
              contentPadding: EdgeInsets.only(bottom: 3),
              labelText: lText,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: pHolder,
              hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
    );
  }
  void settingsModalButtomSheet(context) {
    showModalBottomSheet(context: context, builder: (BuildContext bc) {
      return Container(
        height: MediaQuery
            .of(context)
            .size
            .height * 0.5,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20,),
              Row(
                children: <Widget>[
                  Text('Settings', style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),),
                  Spacer(),
                  IconButton(onPressed: () {
                    Navigator.of(context).pop();
                  }
                      , icon: Icon(
                        Icons.cancel, color: Color(0xff2657ce), size: 30,
                      ))
                ],
              ),
              SizedBox(height: 35,),
              Row(
                children: <Widget>[

                  InkWell(
                    onTap: () =>
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (context) => new EditProfile())),
                    child: Text('Edit profile', style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                    ),
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (context) => new EditProfile()));
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 18,
                      )

                  ),
                ],

              ),

              SizedBox(height: 30,),
              Center(
                  child: RaisedButton(
                    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));},
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Colors.deepPurple,
                    child: Text(
                      'log out',
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2.2,
                        color: Colors.white,
                      ),
                    ),
                  )
              ),

            ],
          ),

        ),

      );
    });
  }
  }



// myGlobal().getFirstName() +" "+ myGlobal().getLastName(),myGlobal().getemail(),myGlobal().getPassword()


