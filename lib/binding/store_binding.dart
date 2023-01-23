import 'package:get/get.dart';
import 'package:weight_tracker/controller/store_weight_controller.dart';

class StoreBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<StoreWeightController>(() => StoreWeightController(),
        fenix: true);
  }
}
