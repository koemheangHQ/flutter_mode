import 'package:flutter/material.dart';
import 'package:fluuter_model/ui_testing/baskground_screen.dart';
import 'package:pip_view/pip_view.dart';

class TestPipView extends StatefulWidget {
  const TestPipView({super.key});

  @override
  State<TestPipView> createState() => _TestPipViewState();
}

class _TestPipViewState extends State<TestPipView> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return PIPView(
      avoidKeyboard: true,
      builder: (context, isFloating) => Scaffold(
        body: Container(
          width: screenSize.width,
          height: screenSize.height,
          color: Colors.blueGrey,
          child: Row(
            children: [
              Container(
                width: screenSize.width / 2,
                height: screenSize.height,
                color: Colors.lightGreenAccent,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return const Text('data');
                  },
                ),
              ),
              Container(
                width: screenSize.width / 2,
                height: screenSize.height,
                color: Colors.yellow,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('data'),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            PIPView.of(context)?.presentBelow(
              const BackGroundScreen(),
            );
          },
        ),
      ),
    );
  }
}
