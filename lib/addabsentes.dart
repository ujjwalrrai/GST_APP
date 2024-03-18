import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sies_gst_notes/physicsG.dart';
import 'package:sies_gst_notes/register.dart';
import 'package:sies_gst_notes/FEsem1.dart';
import 'package:sies_gst_notes/FEsem2.dart';
import 'package:sies_gst_notes/SEsem1.dart';
import 'package:sies_gst_notes/SEsem2.dart';
import 'package:sies_gst_notes/TEsem1.dart';
import 'package:sies_gst_notes/TEsem2.dart';
import 'package:sies_gst_notes/Besem1.dart';
import 'package:sies_gst_notes/BEsem2.dart';
// import 'package:sies_gst_notes/addlecs.dart';
// import 'package:sies_gst_notes/AllStudentsListScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Student {
  String name;
  int present;

  Student({required this.name, this.present = 0});
}

class Addab {
  List<Student> students;

  Addab({required this.students});
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AddabScreen(),
    );
  }
}

class AddabScreen extends StatefulWidget {
  @override
  _AddabScreenState createState() => _AddabScreenState();
}

class _AddabScreenState extends State<AddabScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<int> getLectures() async {
    try {
      DocumentSnapshot snapshot = await _firestore
          .collection('myVariable')
          .doc('DjBr8bZnBXmH2Fd2OOfN')
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

      int present = snapshot.get('present');
      return present;
    } catch (e) {
      print('Error retrieving value from Firebase: $e');
      return 0;
    }
  }

  int totalLectures = 0; // Declare totalLectures as a class variable
  List<Student> updatedStudents = []; // Store updated students

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

  Future<double> calculatePercentage(id) async {
    try {
      DocumentSnapshot lecturesSnapshot = await _firestore
          .collection('myVariable')
          .doc('DjBr8bZnBXmH2Fd2OOfN')
          .get();
      double totalLectures = lecturesSnapshot.get('total_lectures');

      DocumentSnapshot studentsSnapshot =
          await _firestore.collection('studentslist').doc(id).get();
      int totalpresent = studentsSnapshot.get('present', );    
      // hello
     

      if (totalLectures != 0) {
        double percentage = (totalpresent / totalLectures) * 100;
        return percentage;
      } else {
        return 0.0;
      }
    } catch (e) {
      print('Error calculating percentage: $e');
      return 0.0;
    }
  }

  Addab addab = Addab(
    students: [
      Student(name: '1'),
      Student(name: '2'),
      Student(name: '3'),
      Student(name: '4'),
      Student(name: '5'),
      Student(name: '6'),
      Student(name: '7'),
      Student(name: '8'),
      Student(name: '9'),
      Student(name: '10'),
      Student(name: '11'),
      Student(name: '12'),
      Student(name: '13'),
      Student(name: '14'),
      Student(name: '15'),
      Student(name: '16'),
      Student(name: '17'),
      Student(name: '18'),
      Student(name: '19'),
      Student(name: '20'),
      Student(name: '21'),
    ],
  );

  String selectedStudent = '1'; // Default selected student
  Future<void> updatePresentValue(
      String documentId, int newPresentValue) async {
    try {
      await _firestore.collection('studentslist').doc(documentId).update({
        'present': newPresentValue,
      });
    } catch (e) {
      print('Error updating present value in Firestore: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Addab'),
      ),
      body: Column(
        children: [
          DropdownButton<String>(
            value: selectedStudent,
            onChanged: (String? newValue) async {
              setState(() {
                selectedStudent = newValue!;
              });

              // Decrement present value by 1 for the selected student
              for (var student in addab.students) {
                if (student.name == selectedStudent) {
                  int presentValue = await getPresent(
                      'Rollno${addab.students.indexOf(student) + 1}');
                  student.present = (presentValue - 1).clamp(0, presentValue);

                  // Update the reduced present value in Firestore
                  await updatePresentValue(
                      'Rollno${addab.students.indexOf(student) + 1}',
                      student.present);

                  // Store the updated student
                  updatedStudents.add(student);

                  break;
                }
              }

              setState(() {});
            },
            items: addab.students
                .map((student) => student.name)
                .toList()
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          Text('Updated Students List:'),
          // Display the updated list of students with present values and percentage
          Expanded(
            child: ListView.builder(
              itemCount: updatedStudents.length,
              itemBuilder: (context, index) {
                var student = updatedStudents[index];
                return ListTile(
                  title: Text(
                      '${student.name} - Present: ${student.present} - Percentage: ${(student.present / totalLectures) * 100}%'),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () =>
            // Add your button logic here
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => PhysicsG())),
        child: Text('SAVE'),
      ),
    );
  }
}
