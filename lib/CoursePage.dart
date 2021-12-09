import 'package:ew_app/ReferenceBooks.dart';
import 'package:flutter/material.dart';
import 'Videos.dart';

class CoursePage extends StatefulWidget {
  final String chosenImg;
  final String chosenTitle;
  final String chosen_id;

  CoursePage({this.chosenImg, this.chosenTitle,this.chosen_id});

  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  Widget build(BuildContext context) {
    // this.chosenImg;
    return Scaffold(
      backgroundColor: Color(0xfff4f6fd),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.transparent,
          ),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xff2657ce),
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          Text(
          widget.chosenTitle,
          style: TextStyle(
            color: Color(0xff2657ce),
            fontSize: 27,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 20),
        Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Colors.white,
            ),
            child: Hero(
                tag: widget.chosenImg,
                child: Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      image: DecorationImage(
                        image: AssetImage('asset/image/${widget.chosenImg}'),
                      )),
                ))),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Courses Materials',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],),


        SizedBox(
          height: 25,
        ),
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>
            new Videos(
              chName: widget.chosenTitle,
              chImage: widget.chosenImg,
              ch_id: widget.chosen_id,

            )));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Videos',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios_outlined,
                  )),
            ],
          ),
        ),
        InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>
              new ReferenceBooks(
                chName: widget.chosenTitle,
                chImage: widget.chosenImg,
                ch_id: widget.chosen_id,
              )));
            },
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
            Text(
            'Reference Books',
        style: TextStyle(
        fontSize: 18,
        ),
      ),
      IconButton(
          icon: Icon(
            Icons.arrow_forward_ios_outlined,
          )),
      ],
    ),
    ),
    ],
    ),
    ),
    );

  }
}




