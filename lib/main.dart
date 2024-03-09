import 'package:flutter/material.dart';
import 'package:sies_gst_notes/introduction.dart';
import 'package:sies_gst_notes/login.dart';
import 'package:sies_gst_notes/register.dart';
import 'package:sies_gst_notes/dashboard.dart';

import 'package:sies_gst_notes/FEsem1.dart';
import 'package:sies_gst_notes/FEsem2.dart';
import 'package:sies_gst_notes/SEsem1.dart';
import 'package:sies_gst_notes/SEsem2.dart';
import 'package:sies_gst_notes/TEsem1.dart';
import 'package:sies_gst_notes/TEsem2.dart';
import 'package:sies_gst_notes/Besem1.dart';
import 'package:sies_gst_notes/BEsem2.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,

    initialRoute: 'introduction',
    routes: {
      // 'register': (context) => MyRegister(),
      'introduction': (context) => Introduction(),
    },
  ));
}

