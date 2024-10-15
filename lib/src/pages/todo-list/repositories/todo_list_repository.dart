import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../shared/models/todo_view_model.dart';

class TodoListRepository {
  Future<List<TodoViewModel>?> getTodos() async {
    final Uri url = Uri.https('jsonplaceholder.typicode.com', '/todos');
    final http.Response response = await http.get(url);

    try {
      final List<dynamic> jsonData = jsonDecode(response.body);
      final List<TodoViewModel> todos = jsonData
          .map((todo) =>
              TodoViewModel.fromJson(json: todo as Map<String, dynamic>))
          .toList();
      return todos;
    } catch (e) {
      print('Somthing Went Wrong BRUH');
    }

    return null;
  }
}
