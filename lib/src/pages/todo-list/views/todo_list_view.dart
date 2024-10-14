import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/todo_list_controllers.dart';

class TodoListView extends GetView<TodoListControllers> {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          controller.text,
        ),
      ),
    );
  }
}
