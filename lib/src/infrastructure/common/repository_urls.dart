class RepositoryUrls {
  RepositoryUrls._();

  static const String _baseUrl = 'localhost:3000';
  static const String _todos = 'todos';
  static Uri addTodo = Uri.http(_baseUrl, '/$_todos');
  static Uri getTodos = Uri.http(_baseUrl, '/$_todos');

  static Uri getTodoById(int id) => Uri.http(_baseUrl, '/$_todos/$id');
  static Uri removeTodoById(int id) => Uri.http(_baseUrl, '/$_todos/$id');
  static Uri editTodoById(int id) => Uri.http(_baseUrl, '/$_todos/$id');
}
