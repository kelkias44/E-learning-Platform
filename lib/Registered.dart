import 'package:flutter/material.dart';
import 'package:ew_app/buttomNavigationBar.dart';

class Registered extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment : MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: IconButton(
                  icon: Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 200,
                  ),
                ),
              ),
              SizedBox(
                height: 125,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 50),
                child: Text(
                  'Successfully Registered!!',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ButtomNavBar()));},
          child: Text('Continue >>',
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 20,
              color: Colors.green,
            ),),
        ),


      ]),
    );
  }
}
