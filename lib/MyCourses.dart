import 'package:flutter/material.dart';
import 'buttomNavigationBar.dart';
import 'CoursePage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Global.dart';
import 'package:video_player/video_player.dart';


class MyCourses extends StatefulWidget {
  @override
  _MyCoursesState createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
  // var data;
  var getCategories = [
    {
      'Name' : 'Java',
      'Image' : 'asset/image/java.png'
    },
    {
      'Name' : 'Angular',
      'Image' : 'asset/image/angular.png'
    },
    {
      'Name' : 'Firebase',
      'Image' : 'asset/image/img1.png'
    },
    {
      'Name' : 'Html',
      'Image' : 'asset/image/html.png'
    },
    {
      'Name' : 'Php',
      'Image' : 'asset/image/php.png'
    }

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4f6fd),
      appBar: AppBar(
        backgroundColor: Color(0xfff4f6fd),
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ButtomNavBar()));
          },
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
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Text(
                'My courses',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // InkWell(
              //   child: Container(
              //     height: 75,
              //     child: Padding(
              //       padding:
              //           EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              //       child: TextField(
              //         decoration: InputDecoration(
              //           prefixIcon: Icon(
              //             Icons.search,
              //             color: Colors.black,
              //           ),
              //           hintText: "search",
              //           hintStyle: TextStyle(
              //             fontSize: 16,
              //             color: Colors.black.withOpacity(0.5),
              //           ),
              //           enabledBorder: OutlineInputBorder(
              //             borderSide: BorderSide(
              //               color: Colors.grey[400],
              //             ),
              //           ),
              //           border: OutlineInputBorder(
              //             borderSide: BorderSide(
              //               color: Colors.grey[400],
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              Expanded(
                child: GridView.builder(
                  itemCount: getCategories.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.75,
                      crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,

                  ),
                  itemBuilder: (context,index)=>ItemCard(cate: getCategories[index]),
              ),)

            ],
          ),
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key key,
    @required this.cate,
  }) : super(key: key);

  final Map<String, String> cate;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(
          builder: (context) => new CoursePage(
            chosenTitle: cate['Name'],
            chosenImg: cate['Image'],
            chosen_id: cate['_id'],
          ))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 10,left: 10,top: 10),
            // height: 180,
            // width: 160,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image(image:AssetImage(cate['Image'])) ,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Text(
              cate['Name'],style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
            ),
          )
        ],
      ),
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
//       print(data);
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

