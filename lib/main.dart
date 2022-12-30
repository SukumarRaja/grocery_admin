import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'app/ui/screens/dashboard/main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: kIsWeb || Platform.isAndroid
      //     ? FirebaseOptions(
      //         apiKey: "AIzaSyAQNEMuuMesMnwNESNKhqknXy8vstc-QIA",
      //         projectId: "grocery-a5536",
      //         messagingSenderId: "653087935089",
      //         appId: "1:653087935089:web:93d7a3578aca55871129d0",
      //         storageBucket: "grocery-a5536.appspot.com",
      //       )
      //     : null
      );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainDashboard(),
      builder: EasyLoading.init(),
    );
  }
}
