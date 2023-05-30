// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

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
    apiKey: 'AIzaSyCIlT2kviPoFpO1jrbxzo4kF-xEcdlIXok',
    appId: '1:25077138150:web:cb1a9a5d420d329335f127',
    messagingSenderId: '25077138150',
    projectId: 'sds-manliveyoung',
    authDomain: 'sds-manliveyoung.firebaseapp.com',
    storageBucket: 'sds-manliveyoung.appspot.com',
    measurementId: 'G-TDSJTCWD1V',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDKPe_cbixO0bCb7OiFcBymKnLm7Xvb1ZE',
    appId: '1:25077138150:android:25465ead8c8568cc35f127',
    messagingSenderId: '25077138150',
    projectId: 'sds-manliveyoung',
    storageBucket: 'sds-manliveyoung.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDrfFoK-B3VzNOJYePQkAwYcuJqrvdFlzQ',
    appId: '1:25077138150:ios:a9ba50b8bd02179835f127',
    messagingSenderId: '25077138150',
    projectId: 'sds-manliveyoung',
    storageBucket: 'sds-manliveyoung.appspot.com',
    iosBundleId: 'com.example.flutter2',
  );
}
