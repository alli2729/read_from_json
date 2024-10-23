import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/edit_todo_dto.dart';
import '../repositories/edit_todo_repository.dart';

class EditTodoControllers extends GetxController {
  int? todoId;
  EditTodoControllers(this.todoId);

  final formKey = GlobalKey<FormState>();
  final todoController = TextEditingController();
  final EditTodoRepository _repo = EditTodoRepository();
  RxBool isLoading = false.obs;
  RxBool isSubmit = false.obs;
  RxBool switchValue = false.obs;

  String? validate(String? value) {
    if (value != null && value.isEmpty) return 'Todo required';
    return null;
  }

  @override
  onInit() {
    super.onInit();
    getTodo();
  }

  void toggle() => switchValue.toggle();

  Future<void> getTodo() async {
    isLoading.value = true;
    final result = await _repo.getTodo(todoId ?? 0);
    isLoading.value = false;

    result?.fold(
      (exception) {
        Get.showSnackbar(GetSnackBar(title: exception));
      },
      (todo) {
        todoController.text = todo.title;
        switchValue.value = todo.completed;
      },
    );
  }

  Future<void> submit() async {
    if (!(formKey.currentState?.validate() ?? false)) return;

    final EditTodoDto dto = EditTodoDto(
      title: todoController.text,
      userId: 1,
      isCompleted: switchValue.value,
    );

    isSubmit.value = true;
    final result = await _repo.editTodo(todoId!, dto);
    result?.fold(
      (exception) {
        Get.showSnackbar(GetSnackBar(title: exception));
        isSubmit.value = false;
      },
      (map) {
        Get.back(result: map);
        isSubmit.value = false;
      },
    );
  }

  @override
  void dispose() {
    todoController.dispose();
    super.dispose();
  }
}
