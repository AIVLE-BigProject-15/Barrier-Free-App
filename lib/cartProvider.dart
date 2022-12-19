// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'cartItems.dart';

class CartProvider with ChangeNotifier {
  late CollectionReference cart;

  List<CartItems> cartItems = [];

  CartProvider({refer}) {
    cart = refer ?? FirebaseFirestore.instance.collection('cart');
  }

  Future<void> fetchItems() async {
    cartItems = await cart.get().then((QuerySnapshot results) {
      return results.docs.map((DocumentSnapshot document) {
        return CartItems.fromSnapshot(document);
      }).toList();
    });
    notifyListeners();
  }
}