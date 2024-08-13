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
    apiKey: 'AIzaSyBFgGfgpti4rOE9boF0p59lvppYHw5D7_w',
    appId: '1:377325021790:web:3eedf3e01a98dc2e0d62cf',
    messagingSenderId: '377325021790',
    projectId: 'sixam-mart-delivery-5d509',
    authDomain: 'sixam-mart-delivery-5d509.firebaseapp.com',
    storageBucket: 'sixam-mart-delivery-5d509.appspot.com',
    measurementId: 'G-6SZBLW70H3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAPzJWLu2MyBtNQeDVStosTTZFP908CLQY',
    appId: '1:377325021790:android:52db224f1c8cb5950d62cf',
    messagingSenderId: '377325021790',
    projectId: 'sixam-mart-delivery-5d509',
    storageBucket: 'sixam-mart-delivery-5d509.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBO9ujAM_S6cA-azmsJQhNIMipkF_XpS7U',
    appId: '1:377325021790:ios:ac47d6a7e3aef3b10d62cf',
    messagingSenderId: '377325021790',
    projectId: 'sixam-mart-delivery-5d509',
    storageBucket: 'sixam-mart-delivery-5d509.appspot.com',
    iosBundleId: 'com.sixamtech.sixamMartDelivery',
  );
}
