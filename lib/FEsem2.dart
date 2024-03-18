import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import the url_launcher package

class FEsem2new extends StatefulWidget {
  const FEsem2new({Key? key});

  @override
  State<FEsem2new> createState() => _FEsem1newState();
}

class _FEsem1newState extends State<FEsem2new> {
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
              await _launchURL("https://drive.google.com/drive/folders/1XCbRz0SuoXXS6ctqYl1QCUBIJD4Sex0i?usp=drive_link");
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
                  "Engineering Physics 2",
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
              await _launchURL("https://drive.google.com/drive/folders/1KYJt3l1p7n5YZZzZZ3-S-1tGMhbpPiVh?usp=drive_link");
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
                  "Engineering Chemisrty 2",
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
              await _launchURL("https://drive.google.com/drive/folders/1bj85BufFlVEhcK0oHUXP0eUGcTvgt3u2?usp=drive_link");
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
                  "Engineering Math 2",
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
              await _launchURL("https://drive.google.com/drive/folders/1rxaQMx7hM1CE9BWM436cs9jbfxoVXP2x");
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
                  "Engineering Graphics",
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
              await _launchURL("https://drive.google.com/drive/folders/1OPqYq6bfgaobEX2YlHCfGhVKxmFu7PqK");
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
                  "C Programming",
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
              await _launchURL("https://drive.google.com/drive/folders/1bwmFWPRILBQRGjePnZfoJyaeHh9QhpPs?usp=sharing");
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
                  "Professional Communication",
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
