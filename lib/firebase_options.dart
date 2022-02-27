// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCSn5zLvPiQfe0EsuVNT9A2DCbx1mZ0Pi4',
    appId: '1:23176536266:web:4038054ec38fd0c475d433',
    messagingSenderId: '23176536266',
    projectId: 'dqshop-ab0aa',
    authDomain: 'dqshop-ab0aa.firebaseapp.com',
    storageBucket: 'dqshop-ab0aa.appspot.com',
    measurementId: 'G-E32L7P11EG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAmKgPbjgAhU8O2E_t_vl82mgKAPukzquM',
    appId: '1:23176536266:android:1111400eb9fb36a875d433',
    messagingSenderId: '23176536266',
    projectId: 'dqshop-ab0aa',
    storageBucket: 'dqshop-ab0aa.appspot.com',
  );
}
