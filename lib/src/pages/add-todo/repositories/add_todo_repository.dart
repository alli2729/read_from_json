import 'dart:convert';
import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import '../../../infrastructure/common/repository_urls.dart';
import '../models/add_todo_dto.dart';

class AddTodoRepository {
  Future<Either<String, Map<String, dynamic>>?> addTodo(
      AddTodoDto todoDto) async {
    try {
      final body = jsonEncode(todoDto.toJson());
      final http.Response response = await http.post(
        RepositoryUrls.addTodo,
        body: body,
        headers: {'Content-Type': 'application/json'},
      );
      final Map<String, dynamic> result = jsonDecode(response.body);
      return Right(result);
    } catch (e) {
      Left('add todo exception => $e');
    }
    return null;
  }
}
