class TodoListViewModel {
  final int id;
  final int userId;
  final String title;
  final bool completed;

  TodoListViewModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.completed,
  });

  factory TodoListViewModel.fromJson({
    required Map<String, dynamic> json,
  }) {
    return TodoListViewModel(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      completed: json['completed'],
    );
  }
}
