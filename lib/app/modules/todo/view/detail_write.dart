import 'package:flutter/material.dart';
import 'package:fluuter_model/app/modules/todo/controller/detail_write_controller.dart';
import 'package:fluuter_model/core/utils/dismiss_keyboard.dart';
import 'package:get/get.dart';

class DetailWrite extends GetView<DetailWriteController> {
  const DetailWrite({super.key});

  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: GetBuilder(
        init: controller,
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Your word'),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.txtTitle,
                      decoration: const InputDecoration(
                       // border: InputBorder.none,
                        hintText: 'Title:',
                      ),
                      maxLines: 1,
                    ),
                   const  SizedBox(height: 6.0,),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      decoration:   BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(6)),
                        color: Colors.redAccent.withOpacity(0.2),
                      ),
                      child: TextFormField(
                        controller: controller.txtTitle,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Title:',
                        ),
                        maxLines: 20,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        controller.saveTodo();
                      },
                      child: const Text('Save'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
