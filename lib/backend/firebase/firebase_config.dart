import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDc-8sngtjJa0wcx8hoyUne_6H_RSRh-70",
            authDomain: "sadsa-oa0dvp.firebaseapp.com",
            projectId: "sadsa-oa0dvp",
            storageBucket: "sadsa-oa0dvp.appspot.com",
            messagingSenderId: "753156639621",
            appId: "1:753156639621:web:7d3de421e0bab90a5112ec"));
  } else {
    await Firebase.initializeApp();
  }
}
