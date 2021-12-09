import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import  'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:file_picker/file_picker.dart';


class ReferenceBooks extends StatefulWidget {
  final String chName;
  final String chImage;
  final String ch_id;

  ReferenceBooks({this.chImage, this.chName,this.ch_id});

  @override
  _ReferenceBooksState createState() => _ReferenceBooksState();
}

class _ReferenceBooksState extends State<ReferenceBooks> {
  // var data;
  var getBooks = [
    {
      'title':'IT',
      'description':'DR.James'
    },
    {
      'title':'Computer Science',
      'description':'DR.Jacob'
    },
    {
      'title':'Using computers',
      'description':'DR.Jacob'
    },{
      'title':'IS',
      'description':'DR.John'
    },
    {
      'title':'Solution to questions',
      'description':'DR.David'
    }
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
                  'Reference books',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
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
                  itemCount: getBooks.length,
                  itemBuilder: (BuildContext ctx, int index){
                    return Container(
                      child: bookListing(getBooks[index]['title'], getBooks[index]['description'], 'active',context,index));
                    }
              ),
            ),
          )
          ],
        ),
      ),
    ),),],),),);
  }

  Column bookListing(String title, String author, String activeOrInactive,BuildContext context,int index) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 5,
        ),
        InkWell(
          onTap: () async {
            final url = 'http://192.168.43.135:5002/${getBooks[index]['name']}';
            final file = await PDFapi.loadNetwork(url);
            openPDF(context,file);
          },
          child: Row(
            children: <Widget>[
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: (activeOrInactive == 'active')
                      ? Color(0xff2657ce)
                      : Color(0xffd3defa),
                  borderRadius: BorderRadius.all(Radius.circular(17)),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.text_snippet),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '$title',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text('$author',
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
  void openPDF(BuildContext context, File file) =>
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PDFViewerPage(file: file)));
}



class PDFapi{
  static Future<File>loadNetwork(final url) async{
       final response = await http.get(url);
      final bytes = response.bodyBytes;
      return _storeFile(url,bytes);
  }
  static Future<File> _storeFile(String url, List<int> bytes) async {
    final filename = basename(url);
    final dir = await getApplicationDocumentsDirectory();

    final file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes,flush: true);
    return file;

  }
  }


class PDFViewerPage extends StatefulWidget {
  final File file;

  const PDFViewerPage({
    Key key,
    @required this.file,
}) : super(key:key);

  @override
  _PDFViewerPageState createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  @override
  Widget build(BuildContext context) {
    final name = basename(widget.file.path);

      return Scaffold(
        appBar: AppBar(
            title: Text(name),),
            body: PDFView(
              filePath: widget.file.path,
            )
        );
  }
}




// void initState(){
//
//   //setState(() {
//
//   final response = http.post(
//       Uri.parse("http://192.168.43.135:5002/courses/displayAll"),
//       headers : <String , String>{
//
//         'Content-Type' : 'application/json; charset=UTF-8'
//       },
//       body : jsonEncode(<String , String>{
//         'course_id' : widget.ch_id,
//       })
//   );
//   response.then((data){
//     if(data.statusCode == 200){
//       String stringResponse = data.body;
//       var decodedData = jsonDecode(stringResponse);
//       setState(() {
//         getBooks = decodedData['data'];
//       });
//     }
//     else if(data.statusCode == 400){
//       print("data.body");
//     }
//   });
//
//   //});
// }