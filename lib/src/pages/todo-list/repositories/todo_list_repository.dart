import 'dart:convert';
import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import '../../../infrastructure/common/repository_urls.dart';
import '../../shared/models/todo_view_model.dart';

class TodoListRepository {
  Future<Either<String, List<TodoViewModel>>?> getTodos() async {
    final Uri url = RepositoryUrls.getTodos;
    final http.Response response = await http.get(url);

    try {
      final List<dynamic> jsonData = jsonDecode(response.body);
      final List<TodoViewModel> todos = jsonData
          .map((todo) =>
              TodoViewModel.fromJson(json: todo as Map<String, dynamic>))
          .toList();
      return Right(todos);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>?> removeTodoById(int id) async {
    final Uri url = RepositoryUrls.removeTodoById(id);
    final http.Response response = await http.delete(url);

    try {
      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        Left(response.statusCode);
      }
    } catch (exception) {
      return Left(exception.toString());
    }
    return null;
  }
}
