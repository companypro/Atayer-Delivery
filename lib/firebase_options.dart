// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
    apiKey: 'AIzaSyB-Z4jOJVTmqmfzKW8gm5KvvvyogcVmt_o',
    appId: '1:208705892915:web:65bd1b0f68018b32e8e946',
    messagingSenderId: '208705892915',
    projectId: 'atayer-db62e',
    authDomain: 'atayer-db62e.firebaseapp.com',
    storageBucket: 'atayer-db62e.appspot.com',
    measurementId: 'G-Q13VFFQPSH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBNdoGDOaWBjCcsOspW0g_ecmRqi3n2o5g',
    appId: '1:208705892915:android:5883702276d672a5e8e946',
    messagingSenderId: '208705892915',
    projectId: 'atayer-db62e',
    storageBucket: 'atayer-db62e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA3D355_erWymuw-drzeJgZAFc37OpnLcQ',
    appId: '1:208705892915:ios:d755a0e3c0a05873e8e946',
    messagingSenderId: '208705892915',
    projectId: 'atayer-db62e',
    storageBucket: 'atayer-db62e.appspot.com',
    iosBundleId: 'com.sixamtech.sixamMartDelivery',
  );

}