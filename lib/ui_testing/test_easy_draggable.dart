import 'package:easy_draggable/easy_draggable.dart';
import 'package:flutter/material.dart';

class TestEasyDraggable extends StatefulWidget {
  const TestEasyDraggable({super.key, required this.title});

  final String title;

  @override
  State<TestEasyDraggable> createState() => _TestEasyDraggableState();
}

class _TestEasyDraggableState extends State<TestEasyDraggable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: EasyDraggableWidget(
        left: 20.0,
        right: 20.0,
        top: 20.0,
        bottom: 20.0,
        isDraggable: true,
        autoAlign: true,
        padding: const EdgeInsets.all(16),
        floatingBuilder: (context, constraints) {
          return Container(
            width: 100,
            height: 100,
            color: Colors.red,
            child: const Center(
              child: Text(
                'Drag me!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
