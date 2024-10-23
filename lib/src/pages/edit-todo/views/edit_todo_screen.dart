import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/edit_todo_controllers.dart';

class EditTodoScreen extends GetView<EditTodoControllers> {
  const EditTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Obx(() => _fab()),
      appBar: _appBar(),
      body: Obx(_body),
    );
  }

  Widget _fab() {
    if (controller.isSubmit.value) {
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

  Widget _body() => (controller.isLoading.value) ? _loading() : _success();

  Widget _loading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _success() {
    return Center(
      child: Form(
        key: controller.formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _field(),
              const SizedBox(height: 12),
              _switch(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _switch() {
    return Switch(
      value: controller.switchValue.value,
      onChanged: (v) => controller.switchValue.value = v,
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
      title: const Text('Edit Todo'),
      centerTitle: true,
    );
  }
}
