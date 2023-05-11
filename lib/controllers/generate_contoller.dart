import 'package:get/get.dart';

class Productcontroller extends GetxController {
  double selecteddiscount = 0.0;

  empty() {
    selecteddiscount = 0;
    update();
  }
}
