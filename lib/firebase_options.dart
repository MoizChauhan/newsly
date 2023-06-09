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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAoLpYqQ_Ip_iWtlCABxkpheih53SvCvtk',
    appId: '1:450270025538:android:1d40a41a1535792c459adb',
    messagingSenderId: '450270025538',
    projectId: 'authentication-test-246b9',
    storageBucket: 'authentication-test-246b9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAg8iFcHZzXXzEZ9YGbKM665cBMq2QBcaY',
    appId: '1:450270025538:ios:3f027055834e1e8b459adb',
    messagingSenderId: '450270025538',
    projectId: 'authentication-test-246b9',
    storageBucket: 'authentication-test-246b9.appspot.com',
    androidClientId: '450270025538-4b8rgb66v40ucegukrenisdfecfljhqq.apps.googleusercontent.com',
    iosClientId: '450270025538-vcaldn19t29nalj5bk92dlkrdicqpif6.apps.googleusercontent.com',
    iosBundleId: 'com.example.newsly',
  );
}
