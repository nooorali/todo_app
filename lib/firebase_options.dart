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
    apiKey: 'AIzaSyASv1SmxXnYoglUQumq-r03zXCIUr0xH8k',
    appId: '1:866798100373:web:330eec1ad1d24587bea09c',
    messagingSenderId: '866798100373',
    projectId: 'todo-45810',
    authDomain: 'todo-45810.firebaseapp.com',
    databaseURL: 'https://todo-45810-default-rtdb.firebaseio.com',
    storageBucket: 'todo-45810.appspot.com',
    measurementId: 'G-71HBVP17PW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDjXZgXAsr3oFPV5f4TX2u2xAVqUfsOqkA',
    appId: '1:866798100373:android:07a1dd797d64bd11bea09c',
    messagingSenderId: '866798100373',
    projectId: 'todo-45810',
    databaseURL: 'https://todo-45810-default-rtdb.firebaseio.com',
    storageBucket: 'todo-45810.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDeYXZhiFHqt0kesr-DPvm7NCvRMbfdeOg',
    appId: '1:866798100373:ios:4baf43b6b96c8ffebea09c',
    messagingSenderId: '866798100373',
    projectId: 'todo-45810',
    databaseURL: 'https://todo-45810-default-rtdb.firebaseio.com',
    storageBucket: 'todo-45810.appspot.com',
    iosBundleId: 'com.example.todoAppV1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDeYXZhiFHqt0kesr-DPvm7NCvRMbfdeOg',
    appId: '1:866798100373:ios:8c619172d75c12e6bea09c',
    messagingSenderId: '866798100373',
    projectId: 'todo-45810',
    databaseURL: 'https://todo-45810-default-rtdb.firebaseio.com',
    storageBucket: 'todo-45810.appspot.com',
    iosBundleId: 'com.example.todoAppV1.RunnerTests',
  );
}