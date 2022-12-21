// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'items.dart';

class ItemProvider with ChangeNotifier {
  late CollectionReference itemsCoffee;
  late CollectionReference itemsNonCoffee;
  late CollectionReference itemsBread;
  late CollectionReference itemsBottle;
  late CollectionReference itemsMacaron;
  late CollectionReference itemsWholeCake;
  late CollectionReference itemsPieceCake;

  List<Items> coffeeItems = [];
  List<Items> nonCoffeeItems = [];
  List<Items> bottleItems = [];
  List<Items> breadItems = [];
  List<Items> macaronItems = [];
  List<Items> wholeCakeItems = [];
  List<Items> pieceCakeItems = [];

  ItemProvider({refer}) {
    itemsCoffee = refer ?? FirebaseFirestore.instance.collection('coffee');
    itemsNonCoffee = refer ?? FirebaseFirestore.instance.collection('nonCoffee');
    itemsBread = refer ?? FirebaseFirestore.instance.collection('bread');
    itemsBottle = refer ?? FirebaseFirestore.instance.collection('bottle');
    itemsMacaron = refer ?? FirebaseFirestore.instance.collection('macaron');
    itemsWholeCake = refer ?? FirebaseFirestore.instance.collection('wholeCake');
    itemsPieceCake = refer ?? FirebaseFirestore.instance.collection('pieceCake');
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
    bottleItems = await itemsBottle.get().then((QuerySnapshot results) {
      return results.docs.map((DocumentSnapshot document) {
        return Items.fromSnapshot(document);
      }).toList();
    });
    macaronItems = await itemsMacaron.get().then((QuerySnapshot results) {
      return results.docs.map((DocumentSnapshot document) {
        return Items.fromSnapshot(document);
      }).toList();
    });
    wholeCakeItems = await itemsWholeCake.get().then((QuerySnapshot results) {
      return results.docs.map((DocumentSnapshot document) {
        return Items.fromSnapshot(document);
      }).toList();
    });
    pieceCakeItems = await itemsPieceCake.get().then((QuerySnapshot results) {
      return results.docs.map((DocumentSnapshot document) {
        return Items.fromSnapshot(document);
      }).toList();
    });
    notifyListeners();
  }
}