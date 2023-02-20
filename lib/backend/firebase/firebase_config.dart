import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDx-bx0GWkR_AXVtkcPRzOXziAPmDUOQAI",
            authDomain: "h-startup.firebaseapp.com",
            projectId: "h-startup",
            storageBucket: "h-startup.appspot.com",
            messagingSenderId: "67429625408",
            appId: "1:67429625408:web:f71d13799d0e1181c4b9a5"));
  } else {
    await Firebase.initializeApp();
  }
}
