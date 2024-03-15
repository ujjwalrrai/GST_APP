import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sies_gst_notes/register.dart';
import 'package:sies_gst_notes/FEsem1.dart';
import 'package:sies_gst_notes/FEsem2.dart';
import 'package:sies_gst_notes/SEsem1.dart';
import 'package:sies_gst_notes/SEsem2.dart';
import 'package:sies_gst_notes/TEsem1.dart';
import 'package:sies_gst_notes/TEsem2.dart';
import 'package:sies_gst_notes/Besem1.dart';
import 'package:sies_gst_notes/BEsem2.dart';

class MyDashboard extends StatefulWidget {
  const MyDashboard({Key? key}) : super(key: key);

  @override
  State<MyDashboard> createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Your Year'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            height: 90.0,
            width: 400,
            color: Colors.white.withOpacity(0.8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hi, UJJWAL \nWelcome Back',
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 22.0,
                  ),
                ),
                Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.account_circle,
                    color: Colors.blueGrey,
                    size: 40.0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 33,
          ),
          Container(
            height: 120.0,
            width: 370,
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                Container(
                  color: Colors.red,
                  child: Center(child: Text('Photo 1')),
                ),
                Container(
                  color: Colors.blue,
                  child: Center(child: Text('Photo 2')),
                ),
                Container(
                  color: Colors.green,
                  child: Center(child: Text('Photo 3')),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
                children: [
                  _buildYearButton('First Year', Icons.school, () {
                    _showYearDialog(['Sem 1', 'Sem 2']);
                  }),
                  _buildYearButton('Second Year', Icons.school, () {
                    _showYearDialog(['Sem 3', 'Sem 4']);
                  }),
                  _buildYearButton('Third Year', Icons.school, () {
                    _showYearDialog(['Sem 5', 'Sem 6']);
                  }),
                  _buildYearButton('Fourth Year', Icons.school, () {
                    _showYearDialog(['Sem 7', 'Sem 8']);
                  }),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }

  Widget _buildYearButton(String title, IconData icon, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(20.0),
        backgroundColor: Color.fromARGB(255, 212, 171, 219),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          SizedBox(height: 10.0),
          Text(title),
        ],
      ),
    );
  }

  void _showYearDialog(List<String> semesters) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Your Semester'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: semesters.map((semester) {
              return ElevatedButton(
                onPressed: () => _navigateToSemester(semester),
                child: Text(semester),
              );
            }).toList(),
          ),
        );
      },
    );
  }

  void _navigateToSemester(String semester) {
    switch (semester) {
      case 'Sem 1':
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const FEsem1()));
        break;
      case 'Sem 2':
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const FEsem2()));
        break;
      case 'Sem 3':
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const SEsem1()));
        break;
      case 'Sem 4':
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const SEsem2()));
        break;
      case 'Sem 5':
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const TEsem1()));
        break;
      case 'Sem 6':
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const TEsem2()));
        break;
      case 'Sem 7':
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const BEsem1()));
        break;
      case 'Sem 8':
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const BEsem2()));
        break;
    }
  }
}
