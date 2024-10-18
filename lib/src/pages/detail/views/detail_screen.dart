import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/detail_controller.dart';

class DetailScreen extends GetView<DetailController> {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Obx(
        () {
          if ((controller.isLoading.value)) {
            return _loading();
          } else if (controller.isRetry.value) {
            return _retry();
          } else {
            return _success();
          }
        },
      ),
    );
  }

  Widget _retry() {
    return Center(
      child: IconButton(
        onPressed: controller.getTodo,
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'User ID: ${controller.todo.value.userId}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Title: ${controller.todo.value.title}',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          _completedText(),
        ],
      ),
    );
  }

  Widget _completedText() {
    if (controller.todo.value.completed) {
      return const Text(
        'Completed',
        style: TextStyle(
          fontSize: 16,
          color: Colors.green,
        ),
      );
    }
    return const Text(
      'Not Completed',
      style: TextStyle(
        fontSize: 16,
        color: Colors.red,
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text('Todo ${controller.id}'),
      centerTitle: true,
    );
  }
}
