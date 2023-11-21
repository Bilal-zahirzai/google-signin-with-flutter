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
    apiKey: 'AIzaSyAiK363AnB78r7nR7SeNks5pihJ-V-yQ3c',
    appId: '1:443244556593:web:20043a14d6830ef2108010',
    messagingSenderId: '443244556593',
    projectId: 'project-one-bc565',
    authDomain: 'project-one-bc565.firebaseapp.com',
    storageBucket: 'project-one-bc565.appspot.com',
    measurementId: 'G-8MV3VDM55C',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAgWchtZn_zezCK2AT7da1qkXrEzx2ssAw',
    appId: '1:443244556593:android:68ac033595354466108010',
    messagingSenderId: '443244556593',
    projectId: 'project-one-bc565',
    storageBucket: 'project-one-bc565.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDiAXaXGXIfLG3WCQfkfg6K534iX4HwW6c',
    appId: '1:443244556593:ios:90b04d347f986906108010',
    messagingSenderId: '443244556593',
    projectId: 'project-one-bc565',
    storageBucket: 'project-one-bc565.appspot.com',
    iosBundleId: 'com.example.project1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDiAXaXGXIfLG3WCQfkfg6K534iX4HwW6c',
    appId: '1:443244556593:ios:013e36c39152c76f108010',
    messagingSenderId: '443244556593',
    projectId: 'project-one-bc565',
    storageBucket: 'project-one-bc565.appspot.com',
    iosBundleId: 'com.example.project1.RunnerTests',
  );
}
