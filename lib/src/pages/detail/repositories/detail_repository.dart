import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import '../../../infrastructure/common/repository_urls.dart';

import '../../shared/models/todo_view_model.dart';

class DetailRepository {
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
}
