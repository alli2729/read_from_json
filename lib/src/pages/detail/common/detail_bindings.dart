import 'package:get/get.dart';
import '../controller/detail_controller.dart';

class DetailBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailController());
  }
}
