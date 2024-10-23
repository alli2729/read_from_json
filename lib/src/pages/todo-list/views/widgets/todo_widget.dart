import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/todo_list_controllers.dart';
import '../../../shared/models/todo_view_model.dart';

class TodoWidget extends GetView<TodoListControllers> {
  const TodoWidget({
    super.key,
    required this.todo,
    required this.onTap,
    required this.onRemove,
    required this.isCompleted,
  });

  final TodoViewModel todo;
  final bool isCompleted;
  final void Function() onTap;
  final void Function() onRemove;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: _title()),
            _check(),
            const SizedBox(width: 10),
            Obx(() => _removeIcon()),
          ],
        ),
      ),
    );
  }

  Widget _removeIcon() {
    return (controller.loadingValues[todo.id] ?? false)
        ? IconButton(
            onPressed: null,
            icon: Transform.scale(
              scale: .5,
              child: const CircularProgressIndicator(),
            ),
          )
        : IconButton(
            onPressed: onRemove,
            icon: const Icon(Icons.close),
          );
  }

  Widget _check() {
    return (isCompleted)
        ? const Icon(
            Icons.check_circle,
            color: Colors.green,
          )
        : const Icon(
            Icons.cancel,
            color: Colors.red,
          );
  }

  Widget _title() {
    return Text(
      '${todo.id} | ${todo.title}',
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(fontSize: 16),
    );
  }
}
