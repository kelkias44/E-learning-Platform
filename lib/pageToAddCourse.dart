import 'package:flutter/material.dart';
import 'addCourses.dart';
import 'buttomNavigationBar.dart';

class toAddPage extends StatefulWidget {
  @override
  _toAddPageState createState() => _toAddPageState();
}

class _toAddPageState extends State<toAddPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=>ButtomNavBar()));},
      child: Scaffold(
        backgroundColor: Color(0xfff4f6fd),
        appBar: AppBar(
          backgroundColor: Color(0xfff4f6fd),
          leading: IconButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>ButtomNavBar())),
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 40,),
                          Text(
                            'Courses for you',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 20,),
                          // InkWell(
                          //
                          //           child: Container(
                          //             height: 75,
                          //             child: Padding(
                          //               padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                          //               child: TextField(
                          //                decoration: InputDecoration(
                          //                  prefixIcon: Icon(Icons.search,color: Colors.black,),
                          //                  hintText: "search",
                          //                  hintStyle: TextStyle(
                          //                    fontSize: 16,
                          //                    color: Colors.black.withOpacity(0.5),
                          //                ),
                          //                 enabledBorder: OutlineInputBorder(
                          //                   borderSide: BorderSide(
                          //                     color: Colors.grey.shade400,
                          //                   ),
                          //                 ),
                          //                 border: OutlineInputBorder(
                          //                   borderSide: BorderSide(
                          //                     color: Colors.grey.shade400,
                          //                   ),
                          //                 ),
                          //                ),
                          //               ),
                          //             ),
                          //           ),
                          // ),
                          Expanded(child: addCourses()),
                          SizedBox(height: 30,),
                        ],),
                    ),
                              ),

                          // ),
                        // ),
                    ),
    );


  }
}
