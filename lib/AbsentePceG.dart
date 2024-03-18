import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sies_gst_notes/PceG.dart';


class AbsentePceG extends StatelessWidget {
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
                ElevatedButton(
                  onPressed: () {
                    // View absent students button pressed
                    if (checkedStudents.isNotEmpty) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Absent Students'),
                            content: SingleChildScrollView( // Wrap content in SingleChildScrollView
                              child: Container(
                                height: 400, // Increase the fixed height
                                child: ListView(
                                  children: [
                                    for (var student in checkedStudents) Text(student, style: TextStyle(color: Colors.black, fontSize:14),),
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
                               TextButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => PceG(),
                                          ),
                                        );
                                      },
                                      child: Text('Save'),
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
              ],
            ),
          ),
        ],
      ),
    );
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
      DocumentSnapshot snapshot = await _firestore
          .collection('studentslist')
          .doc(documentId)
          .get();

      int present = snapshot.get('presentPCCOE');
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
        'presentPCCOE': newPresentValue,
      });
    } catch (e) {
      print('Error updating present value in Firestore: $e');
    }
  }
}