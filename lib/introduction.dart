import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:sies_gst_notes/calendar.dart';
import 'package:sies_gst_notes/login.dart';

class Introduction extends StatelessWidget {
  const Introduction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        margin: EdgeInsets.only(top: 0.0), // Adding margin from top
        child: IntroductionScreen(
          globalBackgroundColor: Color(0xFF222224),
          scrollPhysics: BouncingScrollPhysics(),
          pages: [
            PageViewModel(
              titleWidget: Text(
                "Write Title ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
               bodyWidget: Text(
    "Introduction Screen allows you to have a screen on an app's first launch to, for example, explain your app. This widget is very customizable with a great design.",
    style: TextStyle(
      color: Colors.white,
      fontSize: 17,
    ),
              ),
              image: Image.asset(
                "assets/intro2.png",
                height: 400,
                width: 400,
              ),
            ),
            PageViewModel(
              titleWidget: Text(
                "Write Title ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
                bodyWidget: Text(
    "Introduction Screen allows you to have a screen on an app's first launch to, for example, explain your app. This widget is very customizable with a great design.",
    style: TextStyle(
       fontSize: 17,
      color: Colors.white,
    ),
              ),
              image: Image.asset(
                "assets/intro1.png",
                
                height: 300,
                width: 300,
              ),
            ),
            PageViewModel(
              titleWidget: Text(
                "Write Title ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              bodyWidget: Text(
    "Introduction Screen allows you to have a screen on an app's first launch to, for example, explain your app. This widget is very customizable with a great design.",
    style: TextStyle(
       fontSize: 17,
      color: Colors.white,
    ),
              ),
              image: Image.asset(
                "assets/intro3.png",
                height: 400,
                width: 400,
              ),
            ),
          ],
          onDone: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyLogin()),
            );
          },
          onSkip: () {},
          showSkipButton: true,
          skip: Text(
            "Skip",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color(0xFF6C63FF),
            ),
          ),
          next: Icon(
            Icons.arrow_forward,
            color: Color(0xFF6C63FF),
          ),
          done: Text(
            "Done",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color(0xFF6C63FF),
            ),
          ),
          dotsDecorator: DotsDecorator(
            size: Size.square(10.0),
            activeSize: Size(20, 10),
            color: Colors.black26,
            activeColor: Color(0xFF6C63FF),
            spacing: EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
      ),
    );
  }
}
