// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA11Y4LI5M8y1Tar87-N2mUXOLywIQSzBw',
    appId: '1:308009840789:web:939f85d73647cabf70ab9c',
    messagingSenderId: '308009840789',
    projectId: 'gst-notes',
    authDomain: 'gst-notes.firebaseapp.com',
    storageBucket: 'gst-notes.appspot.com',
    measurementId: 'G-TTMGSY9B0D',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCM1maC3vpAtZT_NSpcZs1H_7bmrZ-98ts',
    appId: '1:308009840789:android:f5cbad28f21f300870ab9c',
    messagingSenderId: '308009840789',
    projectId: 'gst-notes',
    storageBucket: 'gst-notes.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAZgqOuulVbjAYFdlRmP1fsFQraiVex4mU',
    appId: '1:308009840789:ios:e447a19e92da6b8a70ab9c',
    messagingSenderId: '308009840789',
    projectId: 'gst-notes',
    storageBucket: 'gst-notes.appspot.com',
    iosBundleId: 'com.example.siesGstNotes',
  );
}
