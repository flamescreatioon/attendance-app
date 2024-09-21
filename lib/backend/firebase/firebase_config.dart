import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyB8xsZ9CaNbiDYbT7M8Vk1m38tFe-A3EtE",
            authDomain: "attendance-app-d4771.firebaseapp.com",
            projectId: "attendance-app-d4771",
            storageBucket: "attendance-app-d4771.appspot.com",
            messagingSenderId: "769249143879",
            appId: "1:769249143879:web:1c9a987f8229df5c7b1562",
            measurementId: "G-VGVBVC5ZHE"));
  } else {
    await Firebase.initializeApp();
  }
}
