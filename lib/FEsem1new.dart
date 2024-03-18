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
          ElevatedButton(
            onPressed: () async {
              await _launchURL("https://drive.google.com/drive/folders/1AtsfD4IAc3fVi_zd8eA3jbWO7Q-5ZQn-?usp=drive_link");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFaf8a58),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              padding: EdgeInsets.zero,
            ),
            child: Container(
              height: 60,
              width: 350,
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Center(
                child: Text(
                  "Engineering Physics 1",
                  style: TextStyle(
                    color: Color(0xFF222224),
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 25),
          ElevatedButton(
            onPressed: () async {
              await _launchURL("https://drive.google.com/drive/folders/1LOmZts9wIEj9MpPU9Rtwmy2Ukk8AG86j?usp=sharing");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFaf8a58),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              padding: EdgeInsets.zero,
            ),
            child: Container(
              height: 60,
              width: 350,
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Center(
                child: Text(
                  "Engineering Chemisrty 1",
                  style: TextStyle(
                    color: Color(0xFF222224),
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 25),
          ElevatedButton(
            onPressed: () async {
              await _launchURL("https://drive.google.com/drive/folders/1ZeR8RYw-yHcMhsjVIMos29ugzro9kzOw?usp=drive_link");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFaf8a58),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              padding: EdgeInsets.zero,
            ),
            child: Container(
              height: 60,
              width: 350,
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Center(
                child: Text(
                  "Engineering Math 1",
                  style: TextStyle(
                    color: Color(0xFF222224),
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 25),
          ElevatedButton(
            onPressed: () async {
              await _launchURL("https://drive.google.com/drive/folders/1pNqiVfRbjrKE7J0JhIbF26xD3wnwQ5Z8");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFaf8a58),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              padding: EdgeInsets.zero,
            ),
            child: Container(
              height: 60,
              width: 350,
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Center(
                child: Text(
                  "Engineering Mechanics ",
                  style: TextStyle(
                    color: Color(0xFF222224),
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 25),
          ElevatedButton(
            onPressed: () async {
              await _launchURL("https://drive.google.com/drive/folders/1Wt3aKNecKqx2Lwocelr3bOvtQhAgfioW?usp=drive_link");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFaf8a58),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              padding: EdgeInsets.zero,
            ),
            child: Container(
              height: 60,
              width: 350,
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Center(
                child: Text(
                  "Basic of Electrical Enginnering",
                  style: TextStyle(
                    color: Color(0xFF222224),
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
         
          // Add ElevatedButton widgets for other subjects similarly
        ],
      ),
    );
  }

  Future<void> _launchURL(String url) async {
  try {
    bool launched = await launch(url);
    if (!launched) {
      throw 'Could not launch $url';
    }
  } catch (e) {
    print('Error launching link: $e');
  }
}
}
