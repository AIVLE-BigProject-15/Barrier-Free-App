import 'package:get/get.dart';

class CountController extends GetxController {
  final quantity = 0.obs;
  var total = 0;

  void addTotal(int t){
    total += t;
  }

  void add() {
    quantity.value++;
  }
  void remove() {
    quantity.value--;
  }

}