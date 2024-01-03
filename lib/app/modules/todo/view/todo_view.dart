import 'package:flutter/material.dart';
import 'package:fluuter_model/app/data/model/todo/todo_model.dart';
import 'package:fluuter_model/app/modules/todo/controller/todo_controller.dart';
import 'package:fluuter_model/route/pages/pages.dart';
import 'package:get/get.dart';

class TodoView extends GetView<TodosController> {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.redAccent,
          appBar: AppBar(
            title: const Text('TodoView'),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: controller.widgetList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(
                          Pages.writeDetail,
                          arguments: TodoResponse(
                            title: 'title',
                            description: 'description',
                            id: 1,
                          ),
                        );
                      },
                      // child: controller.widgetList[index],
                      child: Container(
                        height: 100,
                        width: 100,
                        color: Colors.primaries[index],
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  controller.addContainerCard();
                },
                child: const Text('Add'),
              ),
              ElevatedButton(
                onPressed: () {
                  controller.removeContainerCard();
                },
                child: const Text('remove'),
              ),
            ],
          ),
        );
      },
    );
  }
}
