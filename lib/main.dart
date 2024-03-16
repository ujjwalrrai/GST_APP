import 'package:flutter/material.dart';
import 'package:sies_gst_notes/dashboard1.dart';
import 'package:sies_gst_notes/introduction.dart';
import 'package:sies_gst_notes/login.dart';
import 'package:sies_gst_notes/register.dart';

import 'package:sies_gst_notes/FEsem1.dart';
import 'package:sies_gst_notes/FEsem2.dart';
import 'package:sies_gst_notes/SEsem1.dart';
import 'package:sies_gst_notes/SEsem2.dart';
import 'package:sies_gst_notes/TEsem1.dart';
import 'package:sies_gst_notes/TEsem2.dart';
import 'package:sies_gst_notes/Besem1.dart';
import 'package:sies_gst_notes/BEsem2.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:
        (FirebaseAuth.instance.currentUser != null) ? MyLogin() : Dashboard1(),
    initialRoute: 'introduction',
    routes: {
      // 'register': (context) => MyRegister(),
      'introduction': (context) => Introduction(),
    },
  ));
}
