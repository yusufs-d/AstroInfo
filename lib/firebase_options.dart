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
    apiKey: 'AIzaSyAgziIGRhOz4VVuqMOhrTDfe4wHr1N8X6A',
    appId: '1:435308417933:web:1f4dc7ab67d9dc7db623c4',
    messagingSenderId: '435308417933',
    projectId: 'astroinfo-95c4f',
    authDomain: 'astroinfo-95c4f.firebaseapp.com',
    storageBucket: 'astroinfo-95c4f.appspot.com',
    measurementId: 'G-CQ2650F82C',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBC8Qc18uxnqDe-5kQtd8i25yL2Q63VWKE',
    appId: '1:435308417933:android:564fe177cb73ef86b623c4',
    messagingSenderId: '435308417933',
    projectId: 'astroinfo-95c4f',
    storageBucket: 'astroinfo-95c4f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCT1AXtuoFAi9LCvJMF9qSlDsYK-lERBwQ',
    appId: '1:435308417933:ios:d9f0444e1deba285b623c4',
    messagingSenderId: '435308417933',
    projectId: 'astroinfo-95c4f',
    storageBucket: 'astroinfo-95c4f.appspot.com',
    iosClientId: '435308417933-b1jkih4sk4ofjp3cv0hc2fbaanp0anaq.apps.googleusercontent.com',
    iosBundleId: 'com.example.astroInfo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCT1AXtuoFAi9LCvJMF9qSlDsYK-lERBwQ',
    appId: '1:435308417933:ios:d689ac05fc5fca2eb623c4',
    messagingSenderId: '435308417933',
    projectId: 'astroinfo-95c4f',
    storageBucket: 'astroinfo-95c4f.appspot.com',
    iosClientId: '435308417933-8p3ck8poeldrj9q5cqpbvqfnbq6n7uah.apps.googleusercontent.com',
    iosBundleId: 'com.example.astroInfo.RunnerTests',
  );
}
