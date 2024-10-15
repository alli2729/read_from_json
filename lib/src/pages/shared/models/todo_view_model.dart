class TodoViewModel {
  final int id;
  final int userId;
  final String title;
  final bool completed;

  TodoViewModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.completed,
  });

  factory TodoViewModel.fromJson({
    required Map<String, dynamic> json,
  }) {
    return TodoViewModel(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      completed: json['completed'],
    );
  }
}
