// ignore_for_file: prefer_const_constructors, sort_child_properties_last, deprecated_member_use

import 'package:flutter/material.dart';
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
            Text(
              '모두를 위한 키오스크:',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.green[800]
              ),
            ),
            Text(
              '키슈(KIosk IS YOU)',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.green[800]
              ),
            ),
            SizedBox(height: 90,),
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