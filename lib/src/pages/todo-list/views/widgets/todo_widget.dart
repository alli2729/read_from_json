import 'package:flutter/material.dart';
import '../../../shared/models/todo_view_model.dart';

class TodoWidget extends StatelessWidget {
  const TodoWidget({
    super.key,
    required this.todo,
    required this.onTap,
    required this.isCompleted,
  });

  final TodoViewModel todo;
  final bool isCompleted;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: (isCompleted) ? Colors.green[300] : Colors.red[100],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                '${todo.id} | ${todo.title}',
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
