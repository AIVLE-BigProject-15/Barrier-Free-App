import 'package:get/get.dart';

class CountController extends GetxController {
  final quantity = 0.obs;

  void add() {
    quantity.value++;
  }
  void remove() {
    quantity.value--;
  }
}