// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';

class CartItems {
  late String id;
  late String menu;
  late String img;
  late int price;
  late int quantity;
  late int total;

  CartItems({
    required this.id,
    required this.menu,
    required this.img,
    required this.price,
    required this.quantity,
    required this.total,
  });

  CartItems.fromSnapshot(DocumentSnapshot snapshot){
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    id = snapshot.id;
    menu = data['menu'];
    img = data['img'];
    price = data['price'];
    quantity = data['quantity'];
    total = data['total'];
  }
}