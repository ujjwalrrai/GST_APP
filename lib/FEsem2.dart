import 'package:flutter/material.dart';
import 'package:sies_gst_notes/register.dart';
import 'package:url_launcher/url_launcher.dart';

class FEsem2 extends StatefulWidget {
  const FEsem2({super.key});

  @override
  State<FEsem2> createState() => _FEsem2State();
}

class _FEsem2State extends State<FEsem2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/last.jpg'), fit: BoxFit.cover)
      ),



      child: Column(

          children: [
            SizedBox(
              height:  125,
            ),
            Text("Select   Subject",style: TextStyle(color: Colors.white, fontSize: 50,fontWeight: FontWeight.w700,decoration: TextDecoration.none,   fontFamily: 'Teko',),),
            SizedBox(
              height:20,
            ),
            ElevatedButton(
              child: const Text(''
                  'Engineering Physics 2',style: TextStyle(fontFamily: 'Teko', fontSize: 22),),
              onPressed: () async {
                const url = 'https://drive.google.com/drive/folders/1XCbRz0SuoXXS6ctqYl1QCUBIJD4Sex0i?usp=drive_link';
                try {
                  await launch(
                    url,
                    forceSafariVC: false,
                    forceWebView: true,
                    universalLinksOnly: true,
                    enableJavaScript: true,
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
              height: 20,
            ),

            ElevatedButton(
              child: const Text('Engineering Chemistry 2',style: TextStyle(fontFamily: 'Teko', fontSize: 22),),
              onPressed: () async {
                const url = 'https://drive.google.com/drive/folders/1KYJt3l1p7n5YZZzZZ3-S-1tGMhbpPiVh?usp=drive_link';
                try {
                  await launch(
                    url,
                    forceSafariVC: false,
                    forceWebView: true,
                    universalLinksOnly: true,
                    enableJavaScript: true,
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
              height: 20,
            ),
            ElevatedButton(
              child: const Text('Engineering Mathematics 2 ',style: TextStyle(fontFamily: 'Teko', fontSize: 22),),
              onPressed: () async {
                const url = 'https://drive.google.com/drive/folders/1bj85BufFlVEhcK0oHUXP0eUGcTvgt3u2?usp=drive_link';
                try {
                  await launch(
                    url,
                    forceSafariVC: false,
                    forceWebView: true,
                    universalLinksOnly: true,
                    enableJavaScript: true,
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
              height: 20,
            ),
            ElevatedButton(
              child: const Text('C Programming',style: TextStyle(fontFamily: 'Teko', fontSize: 22),),
              onPressed: () async {
                const url = 'https://drive.google.com/drive/folders/1OPqYq6bfgaobEX2YlHCfGhVKxmFu7PqK';
                try {
                  await launch(
                    url,
                    forceSafariVC: false,
                    forceWebView: true,
                    universalLinksOnly: true,
                    enableJavaScript: true,
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
              height: 20,
            ),
            ElevatedButton(
              child: const Text('Engineering Graphics',style: TextStyle(fontFamily: 'Teko', fontSize: 22),),
              onPressed: () async {
                const url = 'https://drive.google.com/drive/folders/1pNqiVfRbjrKE7J0JhIbF26xD3wnwQ5Z8';
                try {
                  await launch(
                    url,
                    forceSafariVC: false,
                    forceWebView: true,
                    universalLinksOnly: true,
                    enableJavaScript: true,
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
              height: 20,
            ),



            ElevatedButton(
              child: const Text('Professional Communication and Ethics',style: TextStyle(fontFamily: 'Teko', fontSize: 22),),
              onPressed: () async {
                const url = 'https://drive.google.com/drive/folders/1bwmFWPRILBQRGjePnZfoJyaeHh9QhpPs?usp=sharing';
                try {
                  await launch(
                    url,
                    forceSafariVC: false,
                    forceWebView: true,
                    universalLinksOnly: true,
                    enableJavaScript: true,
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
