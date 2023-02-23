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
    apiKey: 'AIzaSyAdfwKo-ubDYw7lmsY1O8vXgaVTOB0ZD0c',
    appId: '1:522131753011:web:5ad7dc5518153947f63b46',
    messagingSenderId: '522131753011',
    projectId: 'etiqa-assessment-9ab1d',
    authDomain: 'etiqa-assessment-9ab1d.firebaseapp.com',
    storageBucket: 'etiqa-assessment-9ab1d.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDx-t3yEz_WLv-_TAXJc_R7hx9M635EZKU',
    appId: '1:522131753011:android:1838ed7fd7d2e9d8f63b46',
    messagingSenderId: '522131753011',
    projectId: 'etiqa-assessment-9ab1d',
    storageBucket: 'etiqa-assessment-9ab1d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCZbOHUcBYv3fLKT_vOKhm1IpL_CwXm2vA',
    appId: '1:522131753011:ios:34e9c959aedefab9f63b46',
    messagingSenderId: '522131753011',
    projectId: 'etiqa-assessment-9ab1d',
    storageBucket: 'etiqa-assessment-9ab1d.appspot.com',
    iosClientId: '522131753011-li9p2o7fucmb257jq7fps5m8gdmovd6a.apps.googleusercontent.com',
    iosBundleId: 'com.example.etiqaAssestment',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCZbOHUcBYv3fLKT_vOKhm1IpL_CwXm2vA',
    appId: '1:522131753011:ios:34e9c959aedefab9f63b46',
    messagingSenderId: '522131753011',
    projectId: 'etiqa-assessment-9ab1d',
    storageBucket: 'etiqa-assessment-9ab1d.appspot.com',
    iosClientId: '522131753011-li9p2o7fucmb257jq7fps5m8gdmovd6a.apps.googleusercontent.com',
    iosBundleId: 'com.example.etiqaAssestment',
  );
}