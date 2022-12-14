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
    apiKey: 'AIzaSyAzOHxrZeIxow-HSAY3Akjku3qGY3YHODM',
    appId: '1:28299451913:web:ab82507752686f0ebe22d8',
    messagingSenderId: '28299451913',
    projectId: 'proyectogenerallinea',
    authDomain: 'proyectogenerallinea.firebaseapp.com',
    storageBucket: 'proyectogenerallinea.appspot.com',
    measurementId: 'G-8WYEPG9HSB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAc13qZhQOByntErBQxxV2BZTBhi6oxuOs',
    appId: '1:28299451913:android:bd7b2ad3579e424abe22d8',
    messagingSenderId: '28299451913',
    projectId: 'proyectogenerallinea',
    storageBucket: 'proyectogenerallinea.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAOiwiKGJXBYz4DUNTO1Y3r7X7pM86sa5E',
    appId: '1:28299451913:ios:3d96a20d6a196007be22d8',
    messagingSenderId: '28299451913',
    projectId: 'proyectogenerallinea',
    storageBucket: 'proyectogenerallinea.appspot.com',
    iosClientId: '28299451913-hblhlddo7c75k6l5f9s3s1c5iiqs0dbi.apps.googleusercontent.com',
    iosBundleId: 'co.edu.ucundinamarca.globallinea20222',
  );
}
