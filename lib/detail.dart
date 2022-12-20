// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_declarations, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'items.dart';
import 'package:kiosk/controller.dart';
import 'model_cart.dart';
import 'package:kiosk/pgpage.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  final controller = Get.put(CountController());
  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)!.settings.arguments as Items;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          item.menu
        )
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, 
          children: [
            Padding(padding: EdgeInsets.all(10)),
            Image.network(item.img),
            Padding(padding: EdgeInsets.all(10)),
          Text(
            item.menu,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Text(
            '${item.price}원',
            style: TextStyle(
              fontSize: 20, 
              fontWeight: FontWeight.bold, 
              color: Colors.green
            ),
          ),
          Padding(padding: EdgeInsets.all(5)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  controller.remove();
                },
                icon: Icon(
                  Icons.remove_circle_outline,
                  size: 30,
                )
              ),
              Obx(
                () => Text(
                  '${controller.quantity.value}',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              IconButton(
                onPressed: () {
                  controller.add();
                },
                icon: Icon(
                  Icons.add_circle_outline,
                  size: 30,
                )
              ),
            ],
          ),
          Padding(padding: EdgeInsets.all(10)),
          Text(
            item.description,
            style: TextStyle(fontSize: 20),
          ),
          Spacer(),
          Container(
            height: 70,
            color: Colors.green[200],
            child: Row(
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                    fixedSize: Size(100, 70)
                  ),
                  onPressed: () {
                    CartModel.addCart(item.menu, controller.quantity, item.img, item.price);
                  },
                  child: Text(
                    '장바구니',
                    style: TextStyle(
                      fontSize: 20, 
                      fontWeight: FontWeight.normal
                    ),
                  )
                ),
                Obx(
                  () => Text(
                    '\t\t\t\t${(controller.quantity.value) * item.price}원',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => pgpage()));
                  },
                  child: Text(
                    '주문하기',
                    style: TextStyle(
                      backgroundColor: Colors.green[200],
                      color: Colors.green,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                  )
                )
              ],
            ),
            )
          ]
        ),
      ),
    );
  }
}
