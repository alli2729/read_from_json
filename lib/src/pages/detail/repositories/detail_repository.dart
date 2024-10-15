import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../shared/models/todo_view_model.dart';

class DetailRepository {
  DetailRepository();


  Future<TodoViewModel?> getTodo(int id) async {
    final Uri url = Uri.https('jsonplaceholder.typicode.com', '/todos/$id');
    final http.Response response = await http.get(url);

    try {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      final TodoViewModel todo = TodoViewModel.fromJson(json: jsonData);

      return todo;
    } catch (e) {
      print('Error');
    }
    return null;
  }
}
