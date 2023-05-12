import 'package:get/get.dart';
import 'package:test_okboy/controllers/coin_controller.dart';

class CoinBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CoinController>(CoinController());
  }
}
