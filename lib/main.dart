// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kiosk/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // main 함수에서 async 사용하기 위함
  await Firebase.initializeApp(); // firebase 앱 시작
  runApp(const kioskApp());
}

class kioskApp extends StatelessWidget {
  const kioskApp({super.key});

  // Root widget
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kiosk App for Disabled Person',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage()
    );
  }
}