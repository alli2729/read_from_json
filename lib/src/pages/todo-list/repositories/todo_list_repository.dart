import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/todo_list_view_model.dart';

class TodoListRepository {
  Future<List<TodoListViewModel>?> getTodos() async {
    Uri url = Uri.https('jsonplaceholder.typicode.com', '/todos');
    http.Response response = await http.get(url);

    try {
      final List<dynamic> json = jsonDecode(response.body);
      List<TodoListViewModel> todos =
          json.map((e) => TodoListViewModel.fromJson(json: e)).toList();
      return todos;
    } catch (e) {
      print('Somthing Went Wrong BRUH');
    }

    return null;
  }
}
