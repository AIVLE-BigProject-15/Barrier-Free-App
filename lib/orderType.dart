// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kiosk/menu.dart';

class OrderType extends StatelessWidget {
  const OrderType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          TextButton(
            style: (
              TextButton.styleFrom(
                foregroundColor: Colors.green,
                backgroundColor: Colors.yellow,
                minimumSize: Size(500, 300),
                textStyle: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                )
              )
            ),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Menu()));
            }, 
            child: Text('먹고가기')
            ),

          TextButton(
            style: (
              TextButton.styleFrom(
                foregroundColor: Colors.yellow,
                backgroundColor: Colors.green,
                minimumSize: Size(500, 300),
                textStyle: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold
                )
              )
            ),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Menu()));
            }, 
            child: Text('포장하기')
            ),
        ],
      ),
    );
  }
}