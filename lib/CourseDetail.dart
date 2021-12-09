import 'package:flutter/material.dart';
import 'pageToAddCourse.dart';
import 'Registered.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Global.dart';

class CourseDetail extends StatefulWidget {
  final course_detail_name;
  final course_detail_picture;
  final course_detail_desc;
  final course_id;

  CourseDetail({
    this.course_id,
    this.course_detail_name,
    this.course_detail_picture,
    this.course_detail_desc,
  });

  @override
  _CourseDetailState createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  var data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff4f6fd),
        leading: IconButton(
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => toAddPage())),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300,
            child: GridTile(
                child: Container(
                  color: Colors.white,
                  child: Image.asset(widget.course_detail_picture),
                ),
                footer: new Container(
                  color: Colors.black12,
                  child: ListTile(
                    leading: new Text(
                      widget.course_detail_name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                )),
          ),
          SizedBox(height: 10,),
          Divider(),
          new ListTile(
            title: new Text(
              "Course detail",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            subtitle: new Text(widget.course_detail_desc,),
          ),
          SizedBox(height: 35,),
          Row(
            mainAxisSize: MainAxisSize.min,
              children: <Widget>[
            Expanded(
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width*0.5,
                  child: MaterialButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Registered()));
  },
              // async {
              //   final response = await http.post(
              //       Uri.parse(
              //           "http://192.168.43.135:5002/courses/enroll"),
              //       headers: <String, String>{
              //         'Content-Type': 'application/json; charset=UTF-8'
              //       },
              //       body: jsonEncode(<String, String>{
              //         'email': myGlobal().getemail(),
              //         'course_id': widget.course_id.toString(),
              //       }));




              color: Colors.red,
              textColor: Colors.white,
              child: new Text("Register"),
            ),
                ))
          ])
        ],
      ),
    );
  }
}
