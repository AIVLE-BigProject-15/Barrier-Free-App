import 'package:cloud_firestore/cloud_firestore.dart';

class CartModel {
  static Future addCart(menu, quantity, img, price) async {
      await FirebaseFirestore.instance
          .collection('cart')
          .doc(menu)
          .set({
            'menu': menu,
            'quantity': quantity.value,
            'img': img,
            'price': price,
            'total': (quantity.value) * price,
      });
    }

    static Future delCart(menu) async {
      await FirebaseFirestore.instance
          .collection('cart')
          .doc(menu)
          .delete();
    }
}