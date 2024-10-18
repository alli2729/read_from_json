import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../infrastructure/routes/route_names.dart';
import '../../shared/models/todo_view_model.dart';
import '../repositories/todo_list_repository.dart';

class TodoListControllers extends GetxController {
  final TodoListRepository _repo = TodoListRepository();
  final RxList<TodoViewModel> todos = RxList();
  final String text = 'Hello';

  RxBool isLoading = false.obs;
  RxBool isRetry = false.obs;

  @override
  void onInit() {
    getTodos();
    super.onInit();
  }

  Future<void> getTodos() async {
    isLoading.value = true;
    isRetry.value = false;
    final List<TodoViewModel>? result = await _repo.getTodos();
    if (result != null) {
      isLoading.value = false;
      isRetry.value = false;
      todos.addAll(result);
    } else {
      isLoading.value = false;
      isRetry.value = true;
      showSnackBar();
    }
  }

  void showSnackBar() {
    Get.showSnackbar(
      GetSnackBar(
        message: 'Somthing went wrong',
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.red.shade300,
        margin: const EdgeInsets.all(12),
        borderRadius: 12,
      ),
    );
  }

  void showTodo(int index) {
    Get.toNamed(
      RouteNames.detail,
      parameters: {'id': '${todos[index].id}'},
    );
  }

  Future<void> addTodo() async {
    await Get.toNamed(RouteNames.addTodo);
  }
}
