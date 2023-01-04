// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';

class Final extends StatelessWidget {
  const Final({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(context, '/camera', (route) => false,);
          },
          color: Color(0xffe51937),
          icon: Icon(Icons.arrow_back)
        ),
        elevation: 0.0,
        backgroundColor: Color(0xfff2f2f2),
        foregroundColor: Color(0xffe51937),
        title: Text(
          '처음으로',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 25
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '주문이 완료되었습니다.',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 50,),
            SizedBox(
              width: 300,
              height: 150,
              child: Card(
                color: Colors.grey[300],
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        '주문 번호 462',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        '잠시만 기다려 주세요!',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
      )
    );
  }
}