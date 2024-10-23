import 'package:get/get.dart';
import '../controllers/edit_todo_controllers.dart';

class EditTodoBindings extends Bindings {
  @override
  void dependencies() {
    int? id = int.parse(Get.parameters["id"] ?? "");
    Get.lazyPut(() => EditTodoControllers(id));
  }
}
