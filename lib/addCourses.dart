// import 'dart:io';

import 'package:flutter/material.dart';
import 'CourseDetail.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Global.dart';

class addCourses extends StatefulWidget {
  // String find;
  //
  // addCourses({
  //   this.find,
  // });

  @override
  _addCoursesState createState() => _addCoursesState();
}

class _addCoursesState extends State<addCourses> {
  var data;
  var getCategories = [
    {
      'name' : 'Flutter',
      'photo' : 'asset.image/img2.png',
      'description' : 'flutter is dart framework used to develop web and mobile apps'
    },
    {
      'name' : 'Html 5',
      'photo' : 'asset/image/html.png',
      'description' : 'new and updated version of html'
    },
    {
      'name' : 'Django',
      'photo' : 'asset/image/django.png',
      'description' : 'Django is most known phyton web frame work.used to develop sites like pinterest and youtube'
    },
    {
      'name' : 'Javascript',
      'photo' : 'asset/image/img4.png',
      'description' : 'Javascript is most known web frontend and backend developing language'
    },
    {
      'name' : 'Php',
      'photo' : 'asset/image/php.png',
      'description' : 'Php is backend developing language'
    },
    {
      'name' : 'React',
      'photo' : 'asset/image/img2.png',
      'description' : 'React is javascript framework used to develop frontend'
    }
  ];



  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: getCategories.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.75,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Single_course(
              cour_name: getCategories[index]['name'],
              cour_picture: getCategories[index]['photo'],
              cour_desc: getCategories[index]['description'],
              cour_id: getCategories[index]['_id'],
          );
        }
    );
  }
}


class Single_course extends StatelessWidget {
  final cour_name;
  final cour_picture;
  final cour_desc;
  final cour_id;

  Single_course({
    this.cour_name,
    this.cour_picture,
    this.cour_desc,
    this.cour_id
  });


  @override
  Widget build(BuildContext context) {
      return Card(
          child: Hero(
              tag: cour_name,
              child: Material(
                child: InkWell(
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                      builder: (context) => new CourseDetail(
                        course_detail_name: cour_name,
                        course_detail_picture: cour_picture,
                        course_detail_desc: cour_desc,
                        course_id: cour_id,
                      ))),

                  child: GridTile(
                    footer: Container(
                      color: Colors.black12,
                      child: ListTile(
                        leading: Text(
                            cour_name,
                            style: TextStyle(fontWeight: FontWeight.bold)
                        ),
                      ),
                    ) ,
                    child: Image.asset(cour_picture,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )

          )

    );

  }
}





// void initState(){
//
//   //setState(() {
//
//   final response =  http.get(
//     Uri.parse("http://192.168.43.135:5002/courses/displayAll"),
//     headers : <String , String>{
//       'Content-Type' : 'application/json; charset=UTF-8'
//     },);
//   response.then((data){
//     if(data.statusCode == 200){
//       String stringResponse = data.body;
//       var decodedData = jsonDecode(stringResponse);
//       setState(() {
//         getCategories = decodedData['data'];
//       });
//
//     }
//     else if(data.statusCode == 400){
//       print("data.body");
//     }
//   });
//
//   //});
// }

