import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../repositories/detail_repository.dart';
import '../../shared/models/todo_view_model.dart';

class DetailController extends GetxController {
  int? id;
  DetailController(this.id);

  Rx<TodoViewModel> todo = Rx<TodoViewModel>(
    TodoViewModel(
      id: 0,
      userId: 0,
      title: 'title',
      completed: false,
    ),
  );
  final DetailRepository _repo = DetailRepository();

  RxBool isLoading = false.obs;
  RxBool isRetry = false.obs;

  Future<void> getTodo() async {
    isLoading.value = true;
    isRetry.value = false;

    final result = await _repo.getTodo(id ?? 0);

    result?.fold(
      (exception) {
        isLoading.value = false;
        isRetry.value = true;
        showSnackBar();
      },
      (detail) {
        isLoading.value = false;
        isRetry.value = false;
        todo.value = detail;
      },
    );
  }

  @override
  void onInit() {
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
