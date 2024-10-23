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

  RxMap loadingValues = RxMap({});

  @override
  void onInit() {
    getTodos();
    super.onInit();
  }

  Future<void> getTodos() async {
    isLoading.value = true;
    isRetry.value = false;
    final result = await _repo.getTodos();
    result?.fold(
      (exception) {
        isLoading.value = false;
        isRetry.value = true;
        showFailSnackBar();
      },
      (todoList) {
        isLoading.value = false;
        isRetry.value = false;
        todos.addAll(todoList);
      },
    );
  }

  void showFailSnackBar() {
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

  void showSuccessSnackBar() {
    Get.showSnackbar(
      GetSnackBar(
        message: 'todo added successfully',
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.green.shade300,
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
    final todo = await Get.toNamed(RouteNames.addTodo);

    todos.add(
      TodoViewModel(
        id: todo['id'],
        userId: todo['userId'],
        title: todo['title'],
        completed: todo['completed'],
      ),
    );
    showSuccessSnackBar();
  }

  Future<void> removeTodo(int id) async {
    loadingValues[id] = true;
    final result = await _repo.removeTodoById(id);
    result?.fold(
      (exception) {
        showFailSnackBar();
        loadingValues[id] = false;
      },
      (right) {
        todos.removeWhere((todo) => todo.id == id);
        loadingValues[id] = false;
      },
    );
  }

  Future<void> editTodoById(int id) async {
    final result = await Get.toNamed(
      RouteNames.editTodo,
      parameters: {"id": "$id"},
    );

    int index = todos.indexWhere((element) => element.id == id);

    todos[index] = TodoViewModel(
      id: result['id'],
      userId: result['userId'],
      title: result['title'],
      completed: result['completed'],
    );
  }
}
