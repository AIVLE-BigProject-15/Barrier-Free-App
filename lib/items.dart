import 'package:cloud_firestore/cloud_firestore.dart';

class Items {
  late String id;
  late String menu;
  late String img;
  late String description;
  late int price;

  Items({
    required this.id,
    required this.menu,
    required this.img,
    required this.description,
    required this.price,
  });

  Items.fromSnapshot(DocumentSnapshot snapshot){
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    id = snapshot.id;
    menu = data['menu'];
    img = data['img'];
    description = data['description'];
    price = data['price'];
  }
}