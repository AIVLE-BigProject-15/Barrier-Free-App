import 'package:get/get.dart';

class CountController extends GetxController {
  final quantity = 0.obs;
  final totalPrice = 0.obs;

  void sumPrice(int price) {
    totalPrice.value += price;
  }

  void rmPrice(int price) {
    totalPrice.value -= price;
  }

  void add() {
    quantity.value++;
  }
  void remove() {
    quantity.value--;
  }

}