class EditTodoDto {
  final String title;
  final int userId;
  final bool isCompleted;

  EditTodoDto({
    required this.title,
    required this.userId,
    required this.isCompleted,
  });

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'title': title,
        'completed': isCompleted,
      };
}
