import 'package:get/get.dart';

class CountController extends GetxController {
  final quantity = 0.obs;

  void add() {
    quantity.value++;
    // count(count.value + 1);
  }
  void remove() {
    quantity.value--;
  }
}