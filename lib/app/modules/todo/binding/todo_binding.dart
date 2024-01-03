import 'package:fluuter_model/app/modules/todo/controller/detail_write_controller.dart';
import 'package:fluuter_model/app/modules/todo/controller/todo_controller.dart';
import 'package:get/get.dart';

class TodoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodosController>(() => TodosController());
    Get.lazyPut<DetailWriteController>(() => DetailWriteController());
  }

}
