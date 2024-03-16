import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:sies_gst_notes/AbsentePhysicsG.dart';
// import 'package:sies_gst_notes/calendar.dart';
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
                "NOTES",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
               bodyWidget: Text(
    "Access comprehensive notes tailored to your courses, ensuring you never miss important information. With organized categorization and search functionalities, finding relevant material is effortless, facilitating efficient studying and academic success.",
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
                "BLOGS",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
                bodyWidget: Text(
    "Engage with the vibrant academic community through our interactive blogging platform. Share insights, discuss topics, and collaborate with peers and faculty members, fostering a dynamic exchange of ideas and enriching your learning experience beyond the classroom.",
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
                "ATTENDANCE",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              bodyWidget: Text(
    "Seamlessly track your attendance for classes with our intuitive attendance feature. Receive timely reminders, view your attendance history, and stay on top of your academic commitments, empowering you to maintain excellent attendance records effortlessly",
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
              MaterialPageRoute(builder: (context) =>MyLogin()),
            );
          },
          onSkip: () {
             Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>MyLogin()),
            );
          },
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
