import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;

import '../models/edit_todo_dto.dart';
import '../../../infrastructure/common/repository_urls.dart';
import '../../shared/models/todo_view_model.dart';

class EditTodoRepository {
  Future<Either<String, TodoViewModel>?> getTodo(int id) async {
    final Uri url = RepositoryUrls.getTodoById(id);
    final http.Response response = await http.get(url);

    try {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      final TodoViewModel todo = TodoViewModel.fromJson(json: jsonData);

      return Right(todo);
    } catch (exception) {
      return Left(exception.toString());
    }
  }

  Future<Either<String, Map<String, dynamic>>?> editTodo(
      int id, EditTodoDto dto) async {
    final Uri url = RepositoryUrls.editTodoById(id);
    final http.Response response = await http.patch(
      url,
      body: jsonEncode(dto.toJson()),
      headers: {
        "Content-Type": "application/json",
      },
    );

    try {
      final Map<String, dynamic> result = jsonDecode(response.body);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
