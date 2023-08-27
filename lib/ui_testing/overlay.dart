import 'package:flutter/material.dart';

class OverlayTest extends StatefulWidget {
  const OverlayTest({super.key});

  @override
  State<OverlayTest> createState() => _OverlayTestState();
}

class _OverlayTestState extends State<OverlayTest> {
  OverlayEntry? entry;

  void createOverlapWidget() {
    entry = OverlayEntry(
      builder: (BuildContext context) {
        return SafeArea(
          child: TextButton(
            onPressed: () {},
            child: const Text('data'),
          ),
        );
      },
    );
    final overlay = Overlay.of(context);
    overlay.insert(entry!);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        color: Colors.white,
        child: Center(
          child: TextButton(
            onPressed: () {
              createOverlapWidget();
            },
            child: const Text('Hi Dr Tech'),
          ),
        ),
      ),
    );
  }
}
