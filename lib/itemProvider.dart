// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'items.dart';

class ItemProvider with ChangeNotifier {
  late CollectionReference itemsCoffee;
  late CollectionReference itemsNonCoffee;
  late CollectionReference itemsBread;

  List<Items> coffeeItems = [];
  List<Items> nonCoffeeItems = [];
  List<Items> breadItems = [];

  ItemProvider({refer}) {
    itemsCoffee = refer ?? FirebaseFirestore.instance.collection('coffee');
    itemsNonCoffee = refer ?? FirebaseFirestore.instance.collection('nonCoffee');
    itemsBread = refer ?? FirebaseFirestore.instance.collection('bread');
  }

  Future<void> fetchItems() async {
    coffeeItems = await itemsCoffee.get().then((QuerySnapshot results) {
      return results.docs.map((DocumentSnapshot document) {
        return Items.fromSnapshot(document);
      }).toList();
    });
    nonCoffeeItems = await itemsNonCoffee.get().then((QuerySnapshot results) {
      return results.docs.map((DocumentSnapshot document) {
        return Items.fromSnapshot(document);
      }).toList();
    });
    breadItems = await itemsBread.get().then((QuerySnapshot results) {
      return results.docs.map((DocumentSnapshot document) {
        return Items.fromSnapshot(document);
      }).toList();
    });
    notifyListeners();
  }
}