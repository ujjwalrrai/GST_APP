import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import the url_launcher package

class FEsem1new extends StatefulWidget {
  const FEsem1new({Key? key});

  @override
  State<FEsem1new> createState() => _FEsem1newState();
}

class _FEsem1newState extends State<FEsem1new> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFe1d5c9),
      body: Column(
        children: [
          Container(
            height: 238,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(60),
              ),
              color: Color(0xFF222224),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 80,
                  child: Container(
                    height: 100,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                      color: Color(0xFFe1d5c9),
                    ),
                  ),
                ),
                Positioned(
                  top: 115,
                  left: 20,
                  child: Text(
                    "Select your Subject",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF222224),
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 60),
          buildSubjectContainer(
            subjectName: "Engineering Physics 1",
            googleDriveLink: "https://drive.google.com/drive/folders/1ZeR8RYw-yHcMhsjVIMos29ugzro9kzOw?usp=drive_link",
          ),
          buildSubjectContainer(
            subjectName: "Engineering Chemistry 1",
            googleDriveLink: "YOUR_GOOGLE_DRIVE_LINK_HERE",
          ),
          buildSubjectContainer(
            subjectName: "Engineering Mathematics 1",
            googleDriveLink: "YOUR_GOOGLE_DRIVE_LINK_HERE",
          ),
          buildSubjectContainer(
            subjectName: "Basic Electrical Engineering",
            googleDriveLink: "YOUR_GOOGLE_DRIVE_LINK_HERE",
          ),
          buildSubjectContainer(
            subjectName: "Engineering Mechanics",
            googleDriveLink: "YOUR_GOOGLE_DRIVE_LINK_HERE",
          ),
        ],
      ),
    );
  }

  GestureDetector buildSubjectContainer({
    required String subjectName,
    required String googleDriveLink,
  }) {
    return GestureDetector(
      onTap: () async {
        // Launch the Google Drive link in the default browser
        if (await canLaunch(googleDriveLink)) {
          await launch(googleDriveLink);
        } else {
          throw 'Could not launch $googleDriveLink';
        }
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 0, top: 0, right: 0, left: 0),
        height: 70,
        width: 400,
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFaf8a58),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                subjectName,
                style: TextStyle(
                  color: Color(0xFF222224),
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
