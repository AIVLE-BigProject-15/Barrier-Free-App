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
  late CollectionReference itemsAge20;
  late CollectionReference itemsAge30;
  late CollectionReference itemsAge40;
  late CollectionReference itemsAge60;

  List<Items> coffeeItems = [];
  List<Items> nonCoffeeItems = [];
  List<Items> bottleItems = [];
  List<Items> breadItems = [];
  List<Items> macaronItems = [];
  List<Items> wholeCakeItems = [];
  List<Items> pieceCakeItems = [];
  List<Items> age20Items = [];
  List<Items> age30Items = [];
  List<Items> age40Items = [];
  List<Items> age60Items = [];

  ItemProvider({refer}) {
    itemsCoffee = refer ?? FirebaseFirestore.instance.collection('coffee');
    itemsNonCoffee = refer ?? FirebaseFirestore.instance.collection('nonCoffee');
    itemsBread = refer ?? FirebaseFirestore.instance.collection('bread');
    itemsBottle = refer ?? FirebaseFirestore.instance.collection('bottle');
    itemsMacaron = refer ?? FirebaseFirestore.instance.collection('macaron');
    itemsWholeCake = refer ?? FirebaseFirestore.instance.collection('wholeCake');
    itemsPieceCake = refer ?? FirebaseFirestore.instance.collection('pieceCake');
    itemsAge20 = refer ?? FirebaseFirestore.instance.collection('20대');
    itemsAge30 = refer ?? FirebaseFirestore.instance.collection('30대');
    itemsAge40 = refer ?? FirebaseFirestore.instance.collection('50대');
    itemsAge60 = refer ?? FirebaseFirestore.instance.collection('60대');
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

    age20Items = await itemsAge20.get().then((QuerySnapshot results) {
      return results.docs.map((DocumentSnapshot document) {
        return Items.fromSnapshot(document);
      }).toList();
    });
    age30Items = await itemsAge30.get().then((QuerySnapshot results) {
      return results.docs.map((DocumentSnapshot document) {
        return Items.fromSnapshot(document);
      }).toList();
    });
    age40Items = await itemsAge40.get().then((QuerySnapshot results) {
      return results.docs.map((DocumentSnapshot document) {
        return Items.fromSnapshot(document);
      }).toList();
    });
    age60Items = await itemsAge60.get().then((QuerySnapshot results) {
      return results.docs.map((DocumentSnapshot document) {
        return Items.fromSnapshot(document);
      }).toList();
    });
    notifyListeners();
  }
}