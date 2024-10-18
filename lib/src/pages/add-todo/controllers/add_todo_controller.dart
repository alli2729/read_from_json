import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../repositories/add_todo_repository.dart';

class AddTodoController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final todoController = TextEditingController();
  final AddTodoRepository _repo = AddTodoRepository();

  String? validate(String? value) {
    if (value != null && value.isEmpty) return 'Todo required';
    return null;
  }

  void back() => Get.back();

  Future<void> submit() async {
    if (formKey.currentState?.validate() ?? false) {}
  }
}
