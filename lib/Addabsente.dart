import 'package:flutter/material.dart';

void main() {
  runApp(addabsente());
}

class addabsente extends StatelessWidget {
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
  final List<String> students = List.generate(66, (index) => 'Student ${index + 1}');
  String searchText = '';

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
                : ListView.builder(
                    itemCount: filteredStudents.length,
                    itemBuilder: (context, index) {
                      return StudentItem(student: filteredStudents[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class StudentItem extends StatefulWidget {
  final String student;

  const StudentItem({Key? key, required this.student}) : super(key: key);

  @override
  _StudentItemState createState() => _StudentItemState();
}

class _StudentItemState extends State<StudentItem> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
      title: Text(widget.student),
      trailing: Checkbox(
        value: isChecked,
        onChanged: (value) {
          setState(() {
            isChecked = value!;
          });
        },
      ),
    );
  }
}
