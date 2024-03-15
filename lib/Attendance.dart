import 'package:flutter/material.dart';
import 'package:sies_gst_notes/DivA.dart';
import 'package:sies_gst_notes/calendar.dart';

void main() {
  runApp(Attendance());
}

class Attendance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove debug banner
      home: Scaffold(
        backgroundColor: Color(0xFFe1d5c9),
        
        body: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Container(
              height: 220.0,
              decoration: BoxDecoration(
                color: Color(0xFF222224),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(60.0),bottomLeft: Radius.circular(60.0),
                ),
              ),
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: Text(
                'Select DIV',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 53.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Teko',
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: [
                    AttendanceCard(
                      divName: 'A',
                      inCharge: 'Laxmi Pawani',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Calendar(),
                          ),
                        );
                      },
                    ),
                    AttendanceCard(
                      divName: 'B',
                      inCharge: 'Laxmi Pawani',
                    ),
                    AttendanceCard(
                      divName: 'C',
                      inCharge: 'Laxmi Pawani',
                    ),
                    AttendanceCard(
                      divName: 'D',
                      inCharge: 'Sakhib Sir',
                    ),
                    AttendanceCard(
                      divName: 'E',
                      inCharge: 'Sakhib Sir',
                    ),
                    AttendanceCard(
                      divName: 'F',
                      inCharge: 'Sakhib Sir',
                    ),
                    AttendanceCard(
                      divName: 'G',
                      inCharge: 'Sakhib Sir',
                    ),
                    AttendanceCard(
                      divName: 'H',
                      inCharge: 'Sakhib Sir',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AttendanceCard extends StatelessWidget {
  final String divName;
  final String inCharge;
  final VoidCallback? onTap;

  AttendanceCard({
    required this.divName,
    required this.inCharge,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: SizedBox(
        height: 200,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF222224),
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3), // Shadow color
                  offset: Offset(10,10), // Right and bottom offset
                  // blurRadius: 10, // Spread radius
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Div $divName',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Class incharge: $inCharge',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FirstCardDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Card Detail Page'),
      ),
      body: Center(
        child: Text('This is the detail page for the first card'),
      ),
    );
  }
}
