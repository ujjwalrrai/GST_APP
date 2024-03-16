import 'package:flutter/material.dart';
import 'package:sies_gst_notes/addabsentes.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

// void main() {
//   runApp(Calendar());
// }

class PceG extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      title: 'Calendar Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
          headline6: TextStyle(color: Colors.white),
        ),
      ),
      home: CalendarPage(),
    );
  }
}

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late Future<int> lecturesFuture;

  @override
  void initState() {
    super.initState();
    // Start fetching lectures as soon as the widget is initialized
    lecturesFuture = getLectures();
  }

  Future<int> getLectures() async {
    try {
      // Replace 'your_collection' with the name of your Firestore collection
      DocumentSnapshot snapshot = await _firestore
          .collection('myVariable')
          .doc('GdivPCCOE')
          .get();

      // Replace 'your_field' with the name of the field containing the integer value
      int total_lectures = snapshot.get('total_lectures');
      return total_lectures;
    } catch (e) {
      print('Error retrieving value from Firebase: $e');
      return 0; // Handle the error as needed
    }
  }

  Future<void> lecUpdate() async {
    try {
      // Replace 'your_collection' and 'DjBr8bZnBXmH2Fd2OOfN' with your actual values
      await _firestore
          .collection('myVariable')
          .doc('DjBr8bZnBXmH2Fd2OOfN')
          .update({'total_lectures': FieldValue.increment(1)});
    } catch (e) {
      print('Error updating value in Firebase: $e');
      // Handle the error as needed
    }
  }
  Future<void> updatepresent() async {
    try {
      // Replace 'your_collection' with the name of your Firestore collection
      QuerySnapshot querySnapshot = await _firestore.collection('studentslist').get();

      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        // Update the total_lectures field for each document
        await documentSnapshot.reference.update({'presentPCCOE': FieldValue.increment(1)});
      }
    } catch (e) {
      print('Error updating values in Firebase: $e');
      // Handle the error as needed
    }
  }
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      // appBar: AppBar(
      //   title: Text('Calendar Example'),
      // ),
      backgroundColor: Color(0xFF222224), // Background color
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [Container(
          
          decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft:Radius.circular(80), bottomRight: Radius.circular(80)),
           color: Color(0xFFe1d5c9),),
            height: 150, 
           
            // Adjust height as needed
            alignment: Alignment.center,
            child: Text(
              
              'PCE',
              style: TextStyle(
              
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10),
          TableCalendar(
            firstDay: DateTime.utc(2022, 1, 1),
            lastDay: DateTime.utc(2024, 12, 31),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            onPageChanged: (focusedDay) {
              setState(() {
                _focusedDay = focusedDay;
              });
            },
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
            calendarStyle: CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: Colors.yellow, // Change color to yellow
                shape: BoxShape.circle,
              ),
              selectedTextStyle: TextStyle(color: Colors.black),
              todayDecoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Colors.blue),
                shape: BoxShape.circle,
              ),
              todayTextStyle: TextStyle(color: Colors.white),
              defaultTextStyle: TextStyle(color: Colors.white),
              weekendTextStyle: TextStyle(color: Colors.white),
              outsideTextStyle: TextStyle(color: Colors.grey),
              // unavailableTextStyle: TextStyle(color: Colors.grey),
            ),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
          ),
         SizedBox(height: 20,),
            FutureBuilder<int>(
  future: getLectures(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    } else if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      int totalLectures = snapshot.data!;
      return Text("Total lectures: $totalLectures",style: TextStyle(color: Color(0xFFe1d5c9), fontSize: 25 ),); // Return the text widget
    }
  },
),
 SizedBox(height: 20),
            ElevatedButton(
              
              child: const Text(
                'Add Lecture',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () async {
                // Increment total lectures and update 'present' field for each student
                await lecUpdate();
                await updatepresent();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFeccb50),
                fixedSize: Size(300.0, 45.0),
              ),
            ),
             SizedBox(height: 20),
              ElevatedButton(
              child: const Text(
                'Add Absenties',
                style: TextStyle(color: Colors.black),
              ),
              
              
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AddabScreen(),
                        ),
                      ),
              
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFeccb50),
              
                fixedSize: Size(300.0, 45.0),
              ),
            ),
SizedBox(height: 20),
              ElevatedButton(
              child: const Text(
                'Add Absenties',
                style: TextStyle(color: Colors.black),
              ),
              
              
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AddabScreen(),
                        ),
                      ),
              
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFeccb50),
              
                fixedSize: Size(300.0, 45.0),
              ),
            )
            
        ],
      ),
    );
  }
}
