import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Videos extends StatefulWidget {
  final String chName;
  final String chImage;
  final String ch_id;

  Videos({this.chImage, this.chName,this.ch_id});

  @override
  _VideosState createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  // var data;
  var getVideos = [
    {
      'fileName' : 'Introduction',
      'name' :'Introduction',
      'description' : 'introduction to the course'
    },
    {
      'fileName' : 'Introduction',
      'name' :'Introduction',
      'description' : 'introduction to the course'
    },
    {
      'fileName' : 'Introduction',
      'name' :'Introduction',
      'description' : 'introduction to the course'
    },
    {
      'fileName' : 'Introduction',
      'name' :'Introduction',
      'description' : 'introduction to the course'
    },
    {
      'fileName' : 'Introduction',
      'name' :'Introduction',
      'description' : 'introduction to the course'
    },
  ];


  @override
  Widget build(BuildContext context) {
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
        padding: EdgeInsets.only(left: 15, right: 15, bottom: 5, top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.chName,
              style: TextStyle(
                color: Color(0xff2657ce),
                fontSize: 27,
                fontWeight: FontWeight.w700,
              ),
            ),
            // Text('Teachers name',style: TextStyle(
            //     color: Color(0xff2657ce),
            //     fontSize: 27
            // ),),
            SizedBox(height: 20),
            Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Colors.white,
                ),
                child: Hero(
                    tag: widget.chImage,
                    child: Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          image: DecorationImage(
                            image: AssetImage('asset/image/${widget.chImage}'),
                          )),
                    ))),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Videos ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Color(0xffd3defa),
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 30,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.timer,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      Text(
                        '3 hours,20 min',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 250,
                        child: Expanded(
                          child: ListView.builder(
                            itemCount: getVideos.length,
                            itemBuilder: (BuildContext ctx, int index){
                              return Container(
                                  child: productListing(index,'active'));
                              }
                          ),
                        ),
                      )


                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


  Column productListing(int i,String _isActive) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 5,
        ),
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder:(context) => VideoPlay(
              videoName : getVideos[i]['fileName'],
            )));  },
          child: Row(
            children: <Widget>[
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: (_isActive == 'active')
                      ? Color(0xff2657ce)
                      : Color(0xffd3defa),
                  borderRadius: BorderRadius.all(Radius.circular(17)),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.play_arrow),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "${getVideos[i]['name']}",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text("${getVideos[i]['description']}",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ))
                ],
              )
            ],
          ),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            width: MediaQuery.of(context).size.width * 0.85,
            height: 0.5,
            color: Colors.grey,
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
class VideoPlay extends StatefulWidget {
  final String videoName;

  VideoPlay({
    this.videoName,
});



  @override
  _VideoPlayState createState() => _VideoPlayState();
}

class _VideoPlayState extends State<VideoPlay> {
  VideoPlayerController _controller;
  Future<void> _intitializeVideoPlayerFuture;
  @override
  void initState(){
    _controller = VideoPlayerController.asset('asset/video/PA.mp4');
    _intitializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: FutureBuilder(
          future: _intitializeVideoPlayerFuture,
          builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.done){
              return AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              );
            }
            else{
              return Center(
                child: CircularProgressIndicator(),
              );
            }

          }),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            if(_controller.value.isPlaying){
              _controller.pause();
            }
            else{
              _controller.play();
            }
          });

        },
        child: Icon(_controller.value.isPlaying ? Icons.pause: Icons.play_arrow),
      ),
    );
  }
}



// network('http://192.168.43.135:5002/${widget.videoName}')
// void initState(){
//
//   //setState(() {
//
//   final response = http.get(
//     Uri.parse("http://192.168.43.135:5002/materials/viewVideos"),
//     headers : <String , String>{
//
//       'Content-Type' : 'application/json; charset=UTF-8'
//     },
//     // body : jsonEncode(<String , String>{
//     //   'courseName' : widget.chName,
//     // })
//   );
//   response.then((data){
//     if(data.statusCode == 200){
//       String stringResponse = data.body;
//       var decodedData = jsonDecode(stringResponse);
//       setState(() {
//         getVideos = decodedData['data'];
//       });
//     }
//     else if(data.statusCode == 400){
//       print("data.body");
//     }
//   });
//
//   //});
// }
