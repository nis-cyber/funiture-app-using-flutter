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
    apiKey: 'AIzaSyD9D_7mSANfCGFJ6y7y9NF7HvniX7NenjA',
    appId: '1:1043183492939:web:52ec759e36f3080474d2ce',
    messagingSenderId: '1043183492939',
    projectId: 'furnifind',
    authDomain: 'furnifind.firebaseapp.com',
    storageBucket: 'furnifind.appspot.com',
    measurementId: 'G-TL9L07KT2F',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBupIBZI6YlbAeSi36WplSX8itxEMheX50',
    appId: '1:1043183492939:android:72070090e5ff901874d2ce',
    messagingSenderId: '1043183492939',
    projectId: 'furnifind',
    storageBucket: 'furnifind.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDxKOF1tODaoTFCvmclucmPj4Ib_lIpnXA',
    appId: '1:1043183492939:ios:e79f141607362fc674d2ce',
    messagingSenderId: '1043183492939',
    projectId: 'furnifind',
    storageBucket: 'furnifind.appspot.com',
    iosClientId: '1043183492939-4ogaai6kjv3eqtg1hq0ttvoq3saol79m.apps.googleusercontent.com',
    iosBundleId: 'com.example.furniture',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDxKOF1tODaoTFCvmclucmPj4Ib_lIpnXA',
    appId: '1:1043183492939:ios:b3a30b5079a00ca674d2ce',
    messagingSenderId: '1043183492939',
    projectId: 'furnifind',
    storageBucket: 'furnifind.appspot.com',
    iosClientId: '1043183492939-8lpeeglcl2m749mo6d2kldek8gqc8svj.apps.googleusercontent.com',
    iosBundleId: 'com.example.furniture.RunnerTests',
  );
}
