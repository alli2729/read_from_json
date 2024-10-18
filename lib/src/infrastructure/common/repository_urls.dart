class RepositoryUrls {
  RepositoryUrls._();

  static const String _baseUrl = 'jsonplaceholder.typicode.com';
  static const String _todos = 'todos';
  static Uri addTodo = Uri.https(_baseUrl, '/$_todos');
  static Uri getTodos = Uri.https(_baseUrl, '/$_todos');

  static Uri getTodoById(int id) => Uri.https(_baseUrl, '/$_todos/$id');
}
