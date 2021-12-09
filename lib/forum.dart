import 'package:flutter/material.dart';
import 'MainPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Global.dart';

class ForumPage extends StatefulWidget {
  @override
  _ForumPageState createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  TextEditingController titleController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();
  var getInfo = [
    {
      'first_name' : 'Kelkias',
      'last_name' : "Emana",
       'poster_photo' : 'asset/image/profilePic.png',
       'title' : 'Add',
       'body' : 'please add more courses and more course materials on the firebase.'
    },
{
'first_name' : 'Kelkias',
'last_name' : "Emana",
'poster_photo' : 'asset/image/profilePic.png',
'title' : 'Add',
'body' : 'please add more courses and more course materials on the firebase.'
},
{
'first_name' : 'Kelkias',
'last_name' : "Emana",
'poster_photo' : 'asset/image/profilePic.png',
'title' : 'Add',
'body' : 'please add more courses and more course materials on the firebase.'
}
  ];

  bool likePressed;
  bool dislikePressed;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4f6fd),
      appBar: AppBar(
        backgroundColor: Color(0xfff4f6fd),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              forumModalButtomSheet(context);
            },
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  'Forum',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: getInfo.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    return Container(
                      color: Colors.white54,
                      margin: EdgeInsets.all(20),
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: SizedBox(
                        height: 130,
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                InkWell(
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            "http://192.168.43.135:5002/${getInfo[index]['poster_photo']}"),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text(
                                    '${getInfo[index]['first_name']} ${getInfo[index]['last_name']}',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            Text(
                              '${getInfo[index]['title']}',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            Wrap(
                              // mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                SizedBox(
                                  child: Text(
                                    '${getInfo[index]['body']}',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey,
                                    ),
                                    // maxLines: 3,
                                    // softWrap: false,
                                    // overflow: TextOverflow.visible,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Expanded(
                                  child: Row(
                                    children: <Widget>[
                                      IconButton(
                                        icon: Icon(
                                          Icons.comment,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            likePressed = !likePressed;
                                            dislikePressed = false;
                                          });
                                        },
                                        icon: Icon(Icons.thumb_up,
                                        color: (likePressed == true ? Colors.blue : Colors.grey),
                                        ),
                                      ),
                    Text('${getInfo[index]['upvotes']}'),

                    IconButton(
                      onPressed:(){
                        setState((){
                          likePressed = false;
                          dislikePressed = !dislikePressed;
                        });
                      },
                    icon: Icon(Icons.thumb_down,
                    color: (dislikePressed == true ? Colors.red : Colors.grey)
                    ),),
                    Text('${getInfo[index]['downvotes']}'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            SizedBox(height: 30),
            ],
          ),

        ),
      ),
    );
  }

  void forumModalButtomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Create Forum',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 3),
                        labelText: 'Title',
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: 'enter your title here',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    TextField(
                      controller: descriptionController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 3),
                        labelText: 'Comment',
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: 'write your comment here',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'cancel',
                              style: TextStyle(
                                fontSize: 24,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          InkWell(
                            onTap: () async {
                              final response = await http.post(
                                  Uri.parse(
                                      "http://192.168.43.135:5002/forums/create"),
                                  headers: <String, String>{
                                    'Content-Type': 'application/json; charset=UTF-8'
                                  },
                                  body: jsonEncode(<String, String>{
                                    'title': titleController.text,
                                    'body': descriptionController.text,
                                    'first_name': myGlobal().getFirstName(),
                                    'last_name' : myGlobal().getLastName(),
                                    'poster_photo': myGlobal().getPhoto(),
                                  }));
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Post',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.lightGreen,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ]),
                  ],
                ),
              ));
        });
  }
}




// var data;
// void initState() {
//   //setState(() {
//
//   final response = http.get(
//     Uri.parse("http://192.168.43.135:5002/forums/display"),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8'
//     },
//   );
//   response.then((data) {
//     if (data.statusCode == 200) {
//       String stringResponse = data.body;
//       var decodedData = jsonDecode(stringResponse);
//       print(decodedData);
//       setState(() {
//         getInfo = decodedData['data'];
//       });
//
//
//     } else if (data.statusCode == 400) {
//       print("data.body");
//     }
//   });

//});


// String creatorName;String creatorTitle;String creatorIdea;

