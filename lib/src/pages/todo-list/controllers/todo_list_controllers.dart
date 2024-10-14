import 'package:get/get.dart';
import '../models/todo_list_view_model.dart';
import '../repositories/todo_list_repository.dart';

class TodoListControllers extends GetxController {
  final TodoListRepository _repo = TodoListRepository();
  final List<TodoListViewModel> todos = [];
  final String text = 'Hello';

  @override
  void onInit() {
    _repo.getTodos();

    super.onInit();
  }
}
