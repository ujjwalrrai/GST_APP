import 'package:flutter/material.dart';
import 'package:sies_gst_notes/register.dart';
import 'package:url_launcher/url_launcher.dart';

class SEsem1 extends StatefulWidget {
  const SEsem1({super.key});

  @override
  State<SEsem1> createState() => _SEsem1State();
}

class _SEsem1State extends State<SEsem1> {
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
            Text("Select   Subject",style: TextStyle(color: Colors.white, fontSize: 50,fontWeight: FontWeight.w700, decoration: TextDecoration.none,   fontFamily: 'Teko',),),
            SizedBox(
              height:  20,
            ),
            ElevatedButton(
              child: const Text(''
                  'Discrete structure and graph theory',style: TextStyle(fontFamily: 'Teko', fontSize: 22),),
              onPressed: () async {
                const url = 'https://drive.google.com/drive/folders/1Msje_xjB2u4PTr_2P2TvgMXNDCZsL8hK';
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
              height: 30,
            ),
            ElevatedButton(
              child: const Text('Engineering Mathematics 3 ',style: TextStyle(fontFamily: 'Teko', fontSize: 22),),
      onPressed: () async {
        const url = 'https://drive.google.com/drive/folders/1McmuEXaMKhKF9Pp5DLYuLcH0HzktjICO';
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
              height: 30,
            ),
            ElevatedButton(
              child: const Text('Computer graphics ',style: TextStyle(fontFamily: 'Teko', fontSize: 22),),
    onPressed: () async {
    const url = 'https://drive.google.com/drive/folders/1r2tXtOV7xTw761mtX-tug2p24n01cj1y';
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
              height: 30,
            ),
            ElevatedButton(
              child: const Text('Digital Logic & Computer Architecture',style: TextStyle(fontFamily: 'Teko', fontSize: 22),),
    onPressed: () async {
    const url = 'https://drive.google.com/drive/folders/1yTWMWFCGoBlO4bW_WxChcqrmctHGVfBJ?usp=drive_link';
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
    const url = 'https://drive.google.com/drive/folders/1AtsfD4IAc3fVi_zd8eA3jbWO7Q-5ZQn-?usp=drive_link';
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
