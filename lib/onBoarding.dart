import 'package:flutter/material.dart';
import 'subscription.dart';
import 'package:shared_preferences/shared_preferences.dart';

int initScreen;
Future<void>main()async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = await preferences.getInt('initScreen');
  await preferences.setInt('initScreen',1);
  onBoarding();

}


class UnboardingContent {
  String title;
  String image;
  String Description;

  UnboardingContent({
    this.Description,
    this.image,
    this.title,
  });
}

List<UnboardingContent> content = [
  UnboardingContent(
    title: 'Never stop learning',
    image: 'asset/image/learning.png',
    Description: '',
  ),
  UnboardingContent(
    title: 'Share your knowledge',
    image: 'asset/image/sharing.png',
    Description: '',
  )
];

class onBoarding extends StatefulWidget {


  @override
  _onBoardingState createState() => _onBoardingState();
}

class _onBoardingState extends State<onBoarding> {

  int currentIndex = 0;
  PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    initialRoute: initScreen == 0 || initScreen == null ? 'onboard' : 'subscription';
    routes: {
      subscription : (context) => Subscription();
      onboard : (context)  => onBoarding();
    };
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: content.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: EdgeInsets.all(40),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(content[i].image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        content[i].title,
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        content[i].Description,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                content.length,
                (index) => buildDots(index, context),
              ),
            ),
          ),
          Container(
            height: 60,
            margin: EdgeInsets.all(40),
            width: double.infinity,
            child: FlatButton(
              child: Text(
                  currentIndex == content.length - 1 ? "Continue" : "Next"),
              onPressed: () {
                if (currentIndex == content.length - 1) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Subscription()));
                }
                _controller.nextPage(
                  duration: Duration(milliseconds: 100),
                  curve: Curves.bounceIn,
                );
              },
              color: Colors.redAccent,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildDots(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 20 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.redAccent,
      ),
    );
  }
}

// class UnboardingContent{
//   String image;String title;String title;title descriprion;
//
//   onBoarding({
//     this.image,this.title,this.
// })
// }
