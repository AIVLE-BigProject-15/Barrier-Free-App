// ignore_for_file: prefer_const_constructors, sort_child_properties_last, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:kiosk/orderType.dart';
import 'camera.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/img.gif', alignment: Alignment.center),

            ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => const CameraForAging()
                  )
                );
              }, 
              style: ElevatedButton.styleFrom(
              primary: Colors.yellow,
              textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)
            ),
              child: Text(
                '주문하기',
                style: TextStyle(color: Colors.green)
              )
            ),
          ],
        )     
      ),
    );
  }
}