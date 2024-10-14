import 'package:get/get.dart';
import '../controllers/todo_list_controllers.dart';

class TodoListBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TodoListControllers());
  }
}
