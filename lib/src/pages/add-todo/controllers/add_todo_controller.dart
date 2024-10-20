import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../models/add_todo_dto.dart';
import '../repositories/add_todo_repository.dart';

class AddTodoController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final todoController = TextEditingController();
  final AddTodoRepository _repo = AddTodoRepository();
  RxBool isLoading = false.obs;

  String? validate(String? value) {
    if (value != null && value.isEmpty) return 'Todo required';
    return null;
  }

  // void back() => Get.back();

  Future<void> submit() async {
    if (!(formKey.currentState?.validate() ?? false)) return;
    isLoading.value = true;

    AddTodoDto dto = AddTodoDto(
      title: todoController.text,
      userId: 1,
      isCompleted: false,
    );

    final result = await _repo.addTodo(dto);
    isLoading.value = false;

    result?.fold(
      (exception) {
        Get.showSnackbar(GetSnackBar(title: exception));
      },
      (map) {
        Get.back(result: map);
      },
    );
  }

  @override
  void dispose() {
    todoController.dispose();
    super.dispose();
  }
}
