import 'route_path.dart';

class RouteNames {
  static const String todos = RoutePath.todos;
  static const String detail = '${RoutePath.todos}${RoutePath.detail}';
  static const String addTodo = '${RoutePath.todos}${RoutePath.addTodo}';
}
