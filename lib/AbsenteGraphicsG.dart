import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class AbsenteGraphicsG extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChecklistPage(),
    );
  }
}

class ChecklistPage extends StatefulWidget {
  @override
  _ChecklistPageState createState() => _ChecklistPageState();
}

class _ChecklistPageState extends State<ChecklistPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final List<String> students = List.generate(66, (index) => 'ROLL NO: ${index + 1}');
  String searchText = '';
  List<String> checkedStudents = [];

  @override
  Widget build(BuildContext context) {
    List<String> filteredStudents = students.where((student) {
      return searchText.isEmpty || student.toLowerCase().contains(searchText.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Student Checklist'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
            ),
          ),
          Expanded(
            child: filteredStudents.isEmpty
                ? Center(
                    child: Text('Sorry, no one in the list.'),
                  )
                : Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: filteredStudents.length,
                          itemBuilder: (context, index) {
                            return StudentItem(
                              student: filteredStudents[index],
                              index: index + 1,
                              onChanged: (isChecked) {
                                if (isChecked) {
                                  checkedStudents.add(filteredStudents[index]);
                                } else {
                                  checkedStudents.remove(filteredStudents[index]);
                                }
                              },
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // View absent students button pressed
                              if (checkedStudents.isNotEmpty) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Absent Students'),
                                      content: SingleChildScrollView(
                                        child: Container(
                                          height: 400,
                                          child: ListView(
                                            children: [
                                              for (var student in checkedStudents)
                                                Text(student, style: TextStyle(color: Colors.black, fontSize: 14)),
                                            ],
                                          ),
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Close'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('No students are absent.'),
                                  ),
                                );
                              }
                            },
                            child: Text('View Absent Students'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Save checked students to Firestore
                              saveCheckedStudentsToFirestore();
                            },
                            child: Text('Save Checked Students'),
                          ),
                        ],
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

 Future<void> saveCheckedStudentsToFirestore() async {
  try {
    // Get today's date
    String today = DateFormat('yyyy-MM-dd').format(DateTime.now());

    // Create a document reference with today's date
    DocumentReference documentRef = _firestore.collection('checkedStudentsGraphics').doc(today);

    // Check if document with today's date already exists
    bool documentExists = (await documentRef.get()).exists;

    // If document already exists, generate a new document ID by adding a timestamp
    if (documentExists) {
      String timestamp = DateFormat('HHmmss').format(DateTime.now());
      documentRef = _firestore.collection('checkedStudentsGraphics').doc('$today-$timestamp');
    }

    // Save checked students to Firestore
    await documentRef.set({'students': checkedStudents});

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Checked students saved successfully for $today.'),
      ),
    );
  } catch (e) {
    print('Error saving checked students to Firestore: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Failed to save checked students.'),
      ),
    );
  }
}

}
class StudentItem extends StatefulWidget {
  final String student;
  final int index;
  final ValueChanged<bool> onChanged;

  const StudentItem({Key? key, required this.student, required this.index, required this.onChanged}) : super(key: key);

  @override
  _StudentItemState createState() => _StudentItemState();
}

class _StudentItemState extends State<StudentItem> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool isChecked = false;

  Future<int> getPresent(String documentId) async {
    try {
      DocumentSnapshot snapshot = await _firestore.collection('studentslist').doc(documentId).get();
      int present = snapshot.get('presentEG');
      return present;
    } catch (e) {
      print('Error retrieving value from Firebase: $e');
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
      title: Text(widget.student),
      trailing: Checkbox(
        value: isChecked,
        onChanged: (value) async {
          setState(() {
            isChecked = value!;
          });
          // Update Firestore when the checkbox state changes
          int presentValue = await getPresent('Rollno${widget.index}');
          int newPresentValue = isChecked ? presentValue - 1 : presentValue + 1;
          await updatePresentValue('Rollno${widget.index}', newPresentValue);
          // Notify the parent widget about the change in checked state
          widget.onChanged(isChecked);
        },
      ),
    );
  }

  Future<void> updatePresentValue(String documentId, int newPresentValue) async {
    try {
      await _firestore.collection('studentslist').doc(documentId).update({
        'presentEG': newPresentValue,
      });
    } catch (e) {
      print('Error updating present value in Firestore: $e');
    }
  }
}