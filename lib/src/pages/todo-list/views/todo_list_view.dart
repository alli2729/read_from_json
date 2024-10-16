import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/todo_widget.dart';
import '../controllers/todo_list_controllers.dart';

class TodoListView extends GetView<TodoListControllers> {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(_body),
      appBar: _appBar(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text('Todos'),
      centerTitle: true,
    );
  }

  Widget _body() {
    if (controller.isLoading.value) {
      return _loading();
    } else if (controller.isRetry.value) {
      return _retry();
    } else {
      return _success();
    }
  }

  Widget _retry() {
    return Center(
      child: IconButton(
        onPressed: controller.getTodos,
        icon: const Icon(Icons.change_circle),
      ),
    );
  }

  Widget _loading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _success() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListView.separated(
        itemCount: controller.todos.length,
        itemBuilder: (context, index) => TodoWidget(
          todo: controller.todos[index],
          isCompleted: controller.todos[index].completed,
          onTap: () => controller.showTodo(index),
        ),
        separatorBuilder: (context, index) => const Divider(),
      ),
    );
  }
}
