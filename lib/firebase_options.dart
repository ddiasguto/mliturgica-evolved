// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
        return macos;
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
    apiKey: 'AIzaSyC7ATZWLO0_Vt27MPD8fX-0oIDfSH488co',
    appId: '1:282199642418:web:82f45275c3a1a33621072b',
    messagingSenderId: '282199642418',
    projectId: 'm-liturgica',
    authDomain: 'm-liturgica.firebaseapp.com',
    databaseURL: 'https://m-liturgica-default-rtdb.firebaseio.com',
    storageBucket: 'm-liturgica.appspot.com',
    measurementId: 'G-LE57PBZFRN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAjvOgNY5xqbuM7tKeK5D9WIS19-09iVNg',
    appId: '1:282199642418:android:7ee13ee90360dd2921072b',
    messagingSenderId: '282199642418',
    projectId: 'm-liturgica',
    databaseURL: 'https://m-liturgica-default-rtdb.firebaseio.com',
    storageBucket: 'm-liturgica.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDuVlDpMz_4xmYVw9XG1o2GtpTK3QcSHDo',
    appId: '1:282199642418:ios:d9b625e4299e863e21072b',
    messagingSenderId: '282199642418',
    projectId: 'm-liturgica',
    databaseURL: 'https://m-liturgica-default-rtdb.firebaseio.com',
    storageBucket: 'm-liturgica.appspot.com',
    iosBundleId: 'com.example.signingMass',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDuVlDpMz_4xmYVw9XG1o2GtpTK3QcSHDo',
    appId: '1:282199642418:ios:19edc91d8030dff321072b',
    messagingSenderId: '282199642418',
    projectId: 'm-liturgica',
    databaseURL: 'https://m-liturgica-default-rtdb.firebaseio.com',
    storageBucket: 'm-liturgica.appspot.com',
    iosBundleId: 'com.example.signingMass.RunnerTests',
  );
}
