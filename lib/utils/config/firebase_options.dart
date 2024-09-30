import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyCS49ctyQqXUbJfFcT3xzg_rbY8nCrf8aU',
    appId: '1:462380245979:android:cb0111c150010ba4827dfe',
    messagingSenderId: '462380245979',
    projectId: 'focusflow-cbe66',
    authDomain: 'focusflow-cbe66.firebaseapp.com',
    // storageBucket: 'focusflow-cbe66.appspot.com',
    // measurementId: 'G-B1LNYZ5M77',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCS49ctyQqXUbJfFcT3xzg_rbY8nCrf8aU',
    appId: '1:462380245979:android:cb0111c150010ba4827dfe',
    messagingSenderId: '462380245979',
    projectId: 'focusflow-cbe66',
    storageBucket: 'focusflow-cbe66.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCS49ctyQqXUbJfFcT3xzg_rbY8nCrf8aU',
    appId: '1:462380245979:android:cb0111c150010ba4827dfe',
    messagingSenderId: '462380245979',
    projectId: 'focusflow-cbe66',
    storageBucket: 'focusflow-cbe66.appspot.com',
    iosClientId: '1076599407396-7me650oi63d06l2u373ravhcd2vksiph.apps.googleusercontent.com',
    iosBundleId: 'com.example.drScanGraduationProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCS49ctyQqXUbJfFcT3xzg_rbY8nCrf8aU',
    appId: '1:462380245979:android:cb0111c150010ba4827dfe',
    messagingSenderId: '462380245979',
    projectId: 'focusflow-cbe66',
    storageBucket: 'focusflow-cbe66.appspot.com',
    iosClientId: '1076599407396-7me650oi63d06l2u373ravhcd2vksiph.apps.googleusercontent.com',
    iosBundleId: 'com.example.drScanGraduationProject',
  );
}
