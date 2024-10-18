import 'package:get/get.dart';
import '../controllers/detail_controller.dart';

class DetailBindings extends Bindings {
  @override
  void dependencies() {
    int? id = int.parse(Get.parameters['id'] ?? '');
    Get.lazyPut(() => DetailController(id));
  }
}
