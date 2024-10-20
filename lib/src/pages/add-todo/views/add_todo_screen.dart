import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/add_todo_controller.dart';

class AddTodoScreen extends GetView<AddTodoController> {
  const AddTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Obx(() => _fab()),
      appBar: _appBar(),
      body: _body(),
    );
  }

  Widget _fab() {
    if (controller.isLoading.value) {
      return FloatingActionButton(
        onPressed: null,
        child: Transform.scale(
          scale: 0.5,
          child: const CircularProgressIndicator(),
        ),
      );
    }
    return FloatingActionButton(
      onPressed: controller.submit,
      child: const Icon(Icons.check),
    );
  }

  Widget _body() {
    return Center(
      child: Form(
        key: controller.formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: _field(),
        ),
      ),
    );
  }

  Widget _field() {
    return TextFormField(
      controller: controller.todoController,
      validator: controller.validate,
      decoration: InputDecoration(
        hintText: 'Enter your Todo',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text('Add Todo'),
      centerTitle: true,
    );
  }
}
