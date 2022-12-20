// ignore_for_file: prefer_const_constructors, sort_child_properties_last, deprecated_member_use

import 'package:flutter/material.dart';
import 'camera.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '모두를 위한 키오스크:',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w300,
                color: Color(0xffe51937)
              ),
            ),
            Text(
              '키슈(KIosk IS YOU)',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color(0xffe51937)
              ),
            ),
            SizedBox(height: 30,),
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
                primary: Colors.white,
                textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                fixedSize: Size(200, 70),
                elevation: 1.5
              ),
              child: Text(
                '주문하기',
                style: TextStyle(
                  color: Color(0xffe51937),
                  fontWeight: FontWeight.w800
                )
              )
            ),
          ],
        )     
      ),
    );
  }
}