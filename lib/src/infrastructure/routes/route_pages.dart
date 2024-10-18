import 'package:get/get.dart';
import '../../pages/add-todo/common/add_todo_bindings.dart';
import '../../pages/add-todo/views/add_todo_screen.dart';
import 'route_path.dart';
import '../../pages/detail/common/detail_bindings.dart';
import '../../pages/detail/views/detail_screen.dart';
import '../../pages/todo-list/common/todo_list_bindings.dart';
import '../../pages/todo-list/views/todo_list_view.dart';

class RoutePages {
  static List<GetPage> pages = [
    GetPage(
      name: RoutePath.todos,
      page: () => const TodoListView(),
      binding: TodoListBindings(),
      children: [
        GetPage(
          name: RoutePath.detail,
          page: () => const DetailScreen(),
          binding: DetailBindings(),
        ),
        GetPage(
          name: RoutePath.addTodo,
          page: () => const AddTodoScreen(),
          binding: AddTodoBindings(),
        ),
      ],
    ),
  ];
}
