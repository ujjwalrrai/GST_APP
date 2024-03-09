import 'package:flutter/material.dart';
import 'package:sies_gst_notes/register.dart';
import 'package:url_launcher/url_launcher.dart';

class BEsem1 extends StatefulWidget {
  const BEsem1({super.key});

  @override
  State<BEsem1> createState() => _BEsem1State();
}

class _BEsem1State extends State<BEsem1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/last.jpg'), fit: BoxFit.cover)
      ),



      child: Column(

          children: [
            SizedBox(
              height: 125,
            ),
            Text("Select   Subject",style: TextStyle(color: Colors.white, fontSize: 50,fontWeight: FontWeight.w700,decoration: TextDecoration.none, fontFamily: 'Teko'),),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text('Engineering Physics 1',style: TextStyle(fontFamily: 'Teko', fontSize: 22),),
              onPressed: () async {
                const url = 'https://drive.google.com/drive/folders/1AtsfD4IAc3fVi_zd8eA3jbWO7Q-5ZQn-?usp=drive_link';
                try {
                  await launch(
                    url,
                    forceWebView: true,
                  );
                } catch (e) {
                  print('Error: $e');
                }
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(350.0, 50.0), // Set the desired width and height
              ),

            ),
            SizedBox(
              height: 30,
            ),

            ElevatedButton(
              child: const Text('Engineering Chemistry 1',style: TextStyle(fontFamily: 'Teko', fontSize: 22),),
              onPressed: () async {
                const url = 'https://drive.google.com/drive/folders/1LOmZts9wIEj9MpPU9Rtwmy2Ukk8AG86j?usp=sharing';
                try {
                  await launch(
                    url,
                    forceWebView: true,
                  );
                } catch (e) {
                  print('Error: $e');
                }
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(350.0, 50.0),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              child: const Text('Engineering Mathematics 1 ',style: TextStyle(fontFamily: 'Teko', fontSize: 22),),
              onPressed: () async {
                const url = 'https://drive.google.com/drive/folders/1ZeR8RYw-yHcMhsjVIMos29ugzro9kzOw?usp=drive_link';
                try {
                  await launch(
                    url,
                    forceWebView: true,
                  );
                } catch (e) {
                  print('Error: $e');
                }
              },

              style: ElevatedButton.styleFrom(
                fixedSize: Size(350.0, 50.0),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              child: const Text('Basic Electrical Engineering',style: TextStyle(fontFamily: 'Teko', fontSize: 22),),
              onPressed: () async {
                const url = 'https://drive.google.com/drive/folders/1Wt3aKNecKqx2Lwocelr3bOvtQhAgfioW?usp=drive_link';
                try {
                  await launch(
                    url,
                    forceWebView: true,
                  );
                } catch (e) {
                  print('Error: $e');
                }
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(350.0, 50.0),
              ),


            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              child: const Text('Enginering Mechanics',style: TextStyle(fontFamily: 'Teko', fontSize: 22),),
              onPressed: () async {
                const url = 'https://drive.google.com/drive/folders/1pNqiVfRbjrKE7J0JhIbF26xD3wnwQ5Z8';
                try {
                  await launch(
                    url,
                    forceWebView: true,
                  );
                } catch (e) {
                  print('Error: $e');
                }
              },

              style: ElevatedButton.styleFrom(
                fixedSize: Size(350.0, 50.0),
              ),


            ),
          ]),
    );
  }
}
