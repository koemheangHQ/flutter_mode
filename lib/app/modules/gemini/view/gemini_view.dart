import 'package:flutter/material.dart';
import 'package:fluuter_model/app/modules/gemini/controller/gemini_controller.dart';
import 'package:get/get.dart';

class GeminiView extends GetView<GeminiController> {
  const GeminiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GeminiView'),
        centerTitle: true,
      ),
      body: GetBuilder(
        init: controller,
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.only(
                left: 16.0, right: 16.0, top: 0.0, bottom: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                controller.isLoading
                    ? const CircularProgressIndicator()
                    : controller.isError
                        ? const Center(
                            child: Text("Error"),
                          )
                        : Expanded(
                            child: SingleChildScrollView(
                              child: controller.listPart.isEmpty
                                  ? const Text("Hello world")
                                  : Text(
                                      controller.listPart[0].text.toString(),
                                    ),
                            ),
                          ),
                TextFormField(
                  controller: controller.txtInputCtrl,
                  decoration: InputDecoration(

                    hintText: 'Enter your text',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () => controller.clearTxtInput(),
                      icon: controller.isClear
                          ? const Icon(Icons.clear)
                          : const Icon(Icons.send),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
