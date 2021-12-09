// import 'package:ew_app/route_generator.dart';
// import 'package:ew_app/forum.dart';
// import 'package:ew_app/pageToAddCourse.dart';
// import 'accSetting.dart';
// import 'forum.dart';
// import 'addCourses.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'CourseDetail.dart';
import 'package:flutter/services.dart';
import 'MyCourses.dart';
import 'Global.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class MainPage extends StatefulWidget {


  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // var getdata;
  //   var getCategories = [];
  //   void initState(){
  //
  //     //setState(() {
  //
  //     final response =  http.post(
  //       Uri.parse("http://192.168.43.135:5002/courses/displayMycourse"),
  //       headers : <String , String>{
  //         'Content-Type' : 'application/json; charset=UTF-8'},
  //       body: jsonEncode(<String, String>{
  //         'email': myGlobal().getemail(),
  //       },
  //       ),
  //     );
  //
  //     response.then((data){
  //       if(data.statusCode == 200){
  //         String stringResponse = getdata.body;
  //         var decodedData = jsonDecode(stringResponse);
  //         setState(() {
  //           getCategories = decodedData['getdata'];
  //         });
  //
  //       }
  //       else if(getdata.statusCode == 400){
  //         print("getdata.body");
  //       }
  //     });
  //
  //   }
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
        backgroundColor: Color(0xfff4f6fd),
        body: Container(
          padding: EdgeInsets.only(top: 40, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:<Widget>[
               Container(height: 50,
                   width: 70,child: Image.asset('asset/image/ewket.jpeg')),
               Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('asset/image/${myGlobal().getPhoto()}'),

                  ),
                ),
              ),
              ],
          ),
              SizedBox(height: 25),
              Text('Hi ' + myGlobal().getFirstName(),style: TextStyle(
                fontSize: 35,
                height: 1.3,
                fontWeight: FontWeight.w700,
              ),),
              SizedBox(height: 25),
              Text('Welcome back to ewket',style: TextStyle(
                fontSize: 25,
                height: 1.3,
                fontWeight: FontWeight.w400,
              ),),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                  Text('Mycourses',style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  InkWell(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>MyCourses()));},
                    child: Text('See all >>',style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w200,
                      fontSize: 15,
                    ),
                     ),
                  ),
                ],

              ),
              SizedBox(height: 25),
              Text('Suggested courses',style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),),
              SizedBox(height: 25),
              Expanded(
                  child: SingleChildScrollView(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width*0.4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              courseWidget('Firebase','img1.png',Color(0xffff6a65),Color(0xffff5954),"Firebase is on of the most known back end languages."),
                              SizedBox(height: 20),
                              courseWidget('React','img2.png',Color(0xffe9eefa),Colors.white,"React is on of the most known front end languages."),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              courseWidget('Flutter','img3.png',Color(0xffe9eefa),Colors.white,"Flutter is on of the most known mobile and web app developing languages."),
                              SizedBox(height: 20),
                              courseWidget('Javascript','img4.png',Color(0xffbdcdbfa),Color(0xffcedaff),"Javascript is on of the most known front end and back end languages."),
                            ],
                          ),
                        ),
                      ],
                    ),

              ),
              ),

            ],
          ),
        ),


      ),
    );
  }
  Container courseWidget(String title, String img,Color categoryColor,Color bgColor,String desc)
  {
    return Container(
     padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
     decoration: BoxDecoration(
       color: bgColor,
       borderRadius: BorderRadius.all(Radius.circular(30)),
       ),
      child: InkWell(
        onTap: () => Navigator.of(context).push(new MaterialPageRoute(
        builder: (context) => new CourseDetail(
          course_detail_name: title,
          course_detail_picture: img,
          course_detail_desc: desc,
        ))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: categoryColor,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Text('$title',style: TextStyle(
                color: (categoryColor==Color(0xffe9eefa) ? Color(0xff2657ce) : Colors.white),
              ),),
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Container(
                  height: 5,
                  width: 100,
                  color: (bgColor==Color(0xffff5954)) ? Colors.red: Color(0xff2657ce),
                ),
                Expanded(
                    child: Container(
                      height: 5,
                      color: (bgColor==Color(0xffff5954)) ? Colors.white.withOpacity(0.5): Color(0xff2657ce),
                    )
                )
              ],
            ),
            SizedBox(height: 10),
            Hero(tag: '$img',
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('asset/image/$img'),
                    )
                  ),
                ))
          ],
        ),
      ),
    );


  }
  // void openCoursePage(String img, String title) {
  //   Navigator.pushNamed(context, '/coursePage', arguments: {'chosenImg': img,'chosenTitle': title});
  // }
   }







