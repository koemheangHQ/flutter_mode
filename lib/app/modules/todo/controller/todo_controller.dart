import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluuter_model/app/data/model/todo/todo_model.dart';
import 'package:get/get.dart';

class TodosController extends GetxController {

  final _todos = <TodoResponse>[].obs;
  List<Widget> widgetList = [];
  List<TodoResponse> get todos => _todos.toList();
  final random = Random();
  TodoResponse todoResponse  = TodoResponse(id: 1);



  @override
  void onInit() {
    super.onInit();
    print("Information ${todoResponse.title.toString() }");

  }

  addContainerCard() {
    final randomColor = Colors.primaries[random.nextInt(Colors.primaries.length)];
    widgetList.add(
      Container(
        height: 100,
        width: 100,
        color: randomColor,
      ),
    );
    update();
  }
  removeContainerCard() {
    widgetList.removeLast();
    update();
  }
  void add(TodoResponse todo) {
    //repository.add(todo);
  }

  void remove(TodoResponse todo) {
    //repository.remove(todo);
  }

  void toggle(TodoResponse todo) {
    //repository.toggle(todo);
  }
}