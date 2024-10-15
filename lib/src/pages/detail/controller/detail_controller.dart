import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../repositories/detail_repository.dart';
import '../../shared/models/todo_view_model.dart';

class DetailController extends GetxController {
  Rx<TodoViewModel> todo = Rx<TodoViewModel>(
    TodoViewModel(
      id: 0,
      userId: 0,
      title: 'title',
      completed: false,
    ),
  );
  final DetailRepository _repo = DetailRepository();
  final String idFromParam = Get.parameters['id'] ?? '';
  int id = 0;

  RxBool isLoading = false.obs;
  RxBool isRetry = false.obs;

  Future<void> getTodo() async {
    isLoading.value = true;
    isRetry.value = false;

    final TodoViewModel? result = await _repo.getTodo(id);

    if (result != null) {
      isLoading.value = false;
      isRetry.value = false;
      todo.value = result;
    } else {
      isLoading.value = false;
      isRetry.value = true;
      showSnackBar();
    }
  }

  @override
  void onInit() {
    id = int.parse(idFromParam);
    getTodo();
    super.onInit();
  }

  void showSnackBar() {
    Get.showSnackbar(
      GetSnackBar(
        message: 'Somthing went wrong',
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.red.shade300,
        margin: const EdgeInsets.all(12),
        borderRadius: 12,
      ),
    );
  }

  void goBack() => Get.back();
}
