import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sies_gst_notes/register.dart';
import 'package:sies_gst_notes/FEsem1.dart';
import 'package:sies_gst_notes/FEsem2.dart';
import 'package:sies_gst_notes/SEsem1.dart';
import 'package:sies_gst_notes/SEsem2.dart';
import 'package:sies_gst_notes/TEsem1.dart';
import 'package:sies_gst_notes/TEsem2.dart';
import 'package:sies_gst_notes/Besem1.dart';
import 'package:sies_gst_notes/BEsem2.dart';
// import 'package:sies_gst_notes/addlec.dart';
// import 'package:sies_gst_notes/AllStudentsListScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Student {
  String name;
  int present;

  Student({required this.name, this.present = 0});
}

class Addabb {
  List<Student> students;

  Addabb({required this.students});
}

class ViewChemistryG extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StudentScreen(),
    );
  }
}

class StudentScreen extends StatefulWidget {
  @override
  _StudentScreenState createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<int> getLectures() async {
    try {
      DocumentSnapshot snapshot = await _firestore
          .collection('myVariable')
          .doc('GDivChemistry')
          .get();

      int total_lectures = snapshot.get('total_lectures');
      return total_lectures;
    } catch (e) {
      print('Error retrieving value from Firebase: $e');
      return 0;
    }
  }

  Future<int> getPresent(String documentId) async {
    try {
      DocumentSnapshot snapshot =
          await _firestore.collection('studentslist').doc(documentId).get();

      int present = snapshot.get('presentCHEMISTRY');
      return present;
    } catch (e) {
      print('Error retrieving value from Firebase: $e');
      return 0;
    }
  }

  int totalLectures = 0;

  @override
  void initState() {
    super.initState();
    initializeStudentsPresentValues();
  }

  void initializeStudentsPresentValues() async {
    for (var student in addab.students) {
      int presentValue =
          await getPresent('Rollno${addab.students.indexOf(student) + 1}');
      student.present = presentValue;
    }
    totalLectures = await getLectures();
    setState(() {});
  }

  Future<void> updatePresentValue(
      String documentId, int newPresentValue) async {
    try {
      await _firestore.collection('studentslist').doc(documentId).update({
        'presentCHEMISTRY': newPresentValue,
      });
    } catch (e) {
      print('Error updating present value in Firestore: $e');
    }
  }

  Addabb addab = Addabb(
    students: List.generate(
      66,
      (index) => Student(name: (index + 1).toString()),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color:
                Color(0xFF222224), // Set the background color of the container
            height: 150,
            alignment: Alignment.center,
            child: Text(
              'Attendance List',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Color(0xFFe1d5c9), // Set the background color of the page
              child: ListView.builder(
                itemCount: addab.students.length,
                itemBuilder: (context, index) {
                  var student = addab.students[index];
                  return ListTile(
                    title: RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: 'ROLL NO: ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 19),
                          ),
                          TextSpan(
                              text: '${student.name}',
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )),
                          TextSpan(
                              text:
                                  ' \n- Present: ${student.present}  Percentage: ${(student.present / totalLectures * 100).toStringAsFixed(2)}%',
                              style: TextStyle(
                                fontSize: 16,
                              )),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
