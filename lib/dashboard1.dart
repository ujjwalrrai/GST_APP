import 'package:flutter/material.dart';
import 'package:sies_gst_notes/BEsem2.dart';
import 'package:sies_gst_notes/Besem1.dart';
import 'package:sies_gst_notes/FEsem1.dart';
import 'package:sies_gst_notes/FEsem1new.dart';
import 'package:sies_gst_notes/FEsem2.dart';
import 'package:sies_gst_notes/SEsem1.dart';
import 'package:sies_gst_notes/SEsem2.dart';
import 'package:sies_gst_notes/TEsem1.dart';
import 'package:sies_gst_notes/TEsem2.dart';
import 'package:sies_gst_notes/Attendance.dart';

class Dashboard1 extends StatelessWidget {
  List<String> cateNames = [
    "First year",
    "Second year",
    "Third year",
    "Fourth year"
  ];
  List<Color> cateColors = [
    Color(0xFF222224),
    Color(0xFF222224),
    Color(0xFF222224),
    Color(0xFF222224),
  ];
  List<Icon> cateIcons = [
    Icon(Icons.picture_as_pdf, color: Color(0xFFc79756), size: 35),
    Icon(Icons.book, color: Color(0xFFc79756), size: 35),
    Icon(Icons.notes, color: Color(0xFFc79756), size: 35),
    Icon(Icons.cast_for_education, color: Color(0xFFc79756), size: 35),
  ];

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String userName = "GSTians"; // Default value for userName

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              padding:
                  EdgeInsets.only(top: 40, left: 15, right: 15, bottom: 10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.4,
              decoration: BoxDecoration(
                color: Color(0xFF222224),
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(00)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      _scaffoldKey.currentState!.openDrawer();
                    },
                    child: Icon(
                      Icons.sort,
                      color: Color(0xFFe1d5c9),
                      size: 40,
                    ),
                  ),
                  Text(
                    "Hello $userName", // Using dynamic userName here
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 5,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(65),
                    topRight: Radius.circular(65)),
                color: Color(0xFFe1d5c9),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height / 1.5,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 60, bottom: 30),
              child: Padding(
                padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                child: GridView.builder(
                  itemCount: cateNames.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.1,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        if (cateNames[index] == "First year") {
                          _showSemesterSelectionDialog1(context);
                        }

                        if (cateNames[index] == "Second year") {
                          _showSemesterSelectionDialog2(context);
                        }
                        if (cateNames[index] == "Third year") {
                          _showSemesterSelectionDialog3(context);
                        }
                        if (cateNames[index] == "Fourth year") {
                          _showSemesterSelectionDialog4(context);
                        }
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              color: cateColors[index],
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Center(
                              child: cateIcons[index],
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            cateNames[index],
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF222224),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Color(0xFFe1d5c9),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Text(
                    "What's New",
                    style: TextStyle(
                        color: Color(0xFF6c8c90),
                        fontWeight: FontWeight.w900,
                        fontSize: 23,
                        letterSpacing: 2),
                  ),
                ),
                SizedBox(height: 25),
                ListTile(
                  title: Text(
                    'Blog',
                    style: TextStyle(
                      color: Color(0xFF222224),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  onTap: () {
                    // Navigate to blog page or perform desired action
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text(
                    'Attendance',
                    style: TextStyle(
                      color: Color(0xFF222224),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  onTap: () {
                    // Navigate to the attendance page or perform desired action
                    Navigator.pop(context); // Close the drawer
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Attendance()),
                    );
                  },
                ),
                ListTile(
                  title: Text(
                    'TML Updates',
                    style: TextStyle(
                      color: Color(0xFF222224),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  onTap: () {
                    // Navigate to blog page or perform desired action
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showSemesterSelectionDialog1(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select your semester"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text("Semester 1"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FEsem1new(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text("Semester 2"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FEsem2new(),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showSemesterSelectionDialog2(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select your semester"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text("Semester 3"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SEsem1new(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text("Semester 4"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SEsem2new(),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showSemesterSelectionDialog3(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select your semester"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text("Semester 5"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TEsem1(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text("Semester 6"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TEsem2(),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showSemesterSelectionDialog4(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select your semester"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text("Semester 7"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BEsem1(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text("Semester 8"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BEsem2(),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void main() {
    runApp(MaterialApp(
      home: Dashboard1(),
    ));
  }
}
