import 'package:flutter/material.dart';
import 'accSetting.dart';
import 'forum.dart';
import 'package:ew_app/pageToAddCourse.dart';
import 'MainPage.dart';

class ButtomNavBar extends StatefulWidget {
  @override
  ButtomNavBarState createState() => ButtomNavBarState();
}

class ButtomNavBarState extends State<ButtomNavBar> {
  int _currentIndex = 0;

  final tabs = [
    MainPage(),
    toAddPage(),
    ForumPage(),
    accSetting(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          backgroundColor: Color(0xfff4f6fd),
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Color(0xff2657e).withOpacity(0.5),
                size: 40,
              ),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_to_photos_sharp,
                color: Color(0xff2657e).withOpacity(0.5),
                size: 40,
              ),
              title: Text('Add course'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.forum,
                color: Color(0xff2657e).withOpacity(0.5),
                size: 40,
              ),
              title: Text('Forum'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                color: Color(0xff2657e).withOpacity(0.5),
                size: 40,
              ),
              title: Text('Account'),
            ),
          ],
          selectedItemColor: Color(0xff2657e).withOpacity(0.5),
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ));
  }
}

