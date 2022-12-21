// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:kiosk/menu_drink.dart';

class OrderType extends StatelessWidget {
  const OrderType({super.key});

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
          'Order Type',
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
              '모두를 위한 키오스크: 키슈(KIosk IS YOU)',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xffe51237)
              ),
            ),
            SizedBox(height: 10,),
            Text(
              '어서오세요! 에이블 카페입니다 :)',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: Color(0xffe51237)
              ),
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              ElevatedButton(
                style: (
                  ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Color(0xffffffff),
                    elevation: 1.5,
                    fixedSize: Size(150, 150),
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )
                  )
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const MenuDrink()));
                }, 
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Image.asset('assets/images/shoppingBag.png', width: 100, height: 100,),
                    Text('방문포장')
                  ],
                )
              ),
              SizedBox(width: 20,),
              ElevatedButton(
                style: (
                  ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Color(0xffffffff),
                    elevation: 1.5,
                    fixedSize: Size(150, 150),
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )
                  )
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const MenuDrink()));
                }, 
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Image.asset('assets/images/fork.png', width: 100, height: 100,),
                    Text('매장식사')
                  ],
                )
              ),
              ],
            )
              ]
            )
        ),
    );
  }
}