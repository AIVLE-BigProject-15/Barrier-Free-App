// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:kiosk/home.dart';

void main() => runApp(kioskApp());

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