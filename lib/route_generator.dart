// import 'package:ew_app/CoursePage.dart';
import 'package:ew_app/accSetting.dart';
import 'package:ew_app/MainPage.dart';
import 'package:ew_app/addCourses.dart';
import 'package:ew_app/main.dart';
import 'package:flutter/material.dart';
import 'package:ew_app/pageToAddCourse.dart';
import 'package:ew_app/buttomNavigationBar.dart';
import 'subscription.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/myHomePage' :
        return MaterialPageRoute(builder: (context) => MyHomePage());
      case '/mainPage' :
        return MaterialPageRoute(builder: (context) => MainPage());
      case '/buttomNavigatioBar' :
        return MaterialPageRoute(builder: (context) => ButtomNavBar());
      // case '/coursePage' :
      //   return MaterialPageRoute(builder: (context) {
      //     final Map arguments = ModalRoute.of(context).settings.arguments as Map;
      //     return CoursePage(chosenImg: arguments['img'], chosenTitle: arguments['title']);
      //   });
      case '/addCourses' :
        return MaterialPageRoute(builder: (context) => addCourses());
      case '/accSettings' :
        return MaterialPageRoute(builder: (context) => toAddPage());
      case '/subscription' :
        return MaterialPageRoute(builder: (context) => Subscription());
      default:
        return MaterialPageRoute(builder: (context) => MainPage());
    }
  }
}