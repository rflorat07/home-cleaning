import 'package:firebase_core/firebase_core.dart';

class EnvironmentTemplate {
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: '',
    appId: '',
    messagingSenderId: '',
    projectId: '',
    storageBucket: '',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: '',
    appId: '',
    messagingSenderId: '',
    projectId: '',
    storageBucket: '',
    iosClientId: '',
    iosBundleId: '',
  );
}
