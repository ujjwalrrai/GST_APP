import 'package:flutter/material.dart';
import 'package:sies_gst_notes/ChemG.dart';
import 'package:sies_gst_notes/CpG.dart';
import 'package:sies_gst_notes/GraphicsG.dart';
import 'package:sies_gst_notes/PceG.dart';
import 'package:sies_gst_notes/mathG.dart';
// import 'package:sies_gst_notes/DivA.dart';
// // import 'package:sies_gst_notes/calendar.dart';
import 'package:sies_gst_notes/physicsG.dart';

class Selectsubj extends StatelessWidget {
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
                  bottomRight: Radius.circular(60.0),
                  bottomLeft: Radius.circular(60.0),
                ),
              ),
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: Text(
                'Select Subject',
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
                padding: const EdgeInsets.all(30.0),
                child: ListView(
                  children: [
                    AttendanceCard(
                      divName: 'A',
                      inCharge: 'Physics',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PhysicsG(),
                          ),
                        );
                      },
                    ),
                    AttendanceCard(
                      divName: 'B',
                      inCharge: 'Chemistry',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChemG(),
                          ),
                        );
                      },

                    ),
                    AttendanceCard(
                      divName: 'C',
                      inCharge: 'Math',
                       onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => mathG(),
                          ),
                        );
                      },
                      
                    ),
                    AttendanceCard(
                      divName: 'D',
                      inCharge: 'Graphics',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GraphicsG(),
                          ),
                        );
                      },

                    ),
                    AttendanceCard(
                      divName: 'E',
                      inCharge: 'PCE',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PceG(),
                          ),
                        );
                      },

                    ),
                    AttendanceCard(
                      divName: 'F',
                      inCharge: 'C Programming',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CpG(),
                          ),
                        );
                      },
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
      padding: const EdgeInsets.only(bottom: 29.0),
      child: SizedBox(
        height: 100,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF222224),
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3), // Shadow color
                  offset: Offset(10, 10), // Right and bottom offset
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
