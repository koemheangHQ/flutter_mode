import 'package:flutter/material.dart';
import 'package:fluuter_model/route/pages/pages.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

Offset centerDragAnchorStrategy(
    Draggable<Object> draggable, BuildContext context, Offset position) {
  final RenderBox renderObject = context.findRenderObject()! as RenderBox;
  return Offset(renderObject.size.width / 2, renderObject.size.height / 2);
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;
  bool _isDragging = false;
  double width = 100.0, height = 100.0;
  final GlobalKey _draggableKey = GlobalKey();

  late Offset position;
  late Offset _dragOffset;
  late String result = '';
  int res = 1;
  List<String> members = [
    "Koemheang9",
    "koemheang10",
    // "koemheang11",
    // "koemheang12",
    // "koemheang13",
    // "koemheang14",
    // "koemheang15",
    // "koemheang16",
    // "koemheang17",
    // "koemheang18",
    // "koemheang19",
    // "koemheang20",
  ];

  @override
  void initState() {
    super.initState();
    position = const Offset(0, 0);
    _dragOffset = const Offset(0, 0);
    result = '';

    _animationController = AnimationController(
      duration: const Duration(minutes: 1),
      vsync: this,
    );
    _animation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(1.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutBack,
      ),
    );
  }

  void _animateToPosition(Offset offset) {
    RenderBox renderBox =
        _draggableKey.currentContext?.findRenderObject() as RenderBox;
    var position = renderBox.localToGlobal(Offset.zero);
    setState(() {
      position = Offset(offset.dx - position.dx, offset.dy - position.dy);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;
    void calculator(
        double width, double height, double dxOfScreen, double dyOfScreen) {
      double widthCenterSize = width / 2;
      double heightCenterSize = height / 2;
      if (dxOfScreen > widthCenterSize && dyOfScreen > heightCenterSize) {
        position = Offset(screenWidth * 0.74, screenHeight * 0.74);
        debugPrint('OffSetInfo: bottomRight');
      } else if (dxOfScreen > widthCenterSize &&
          dyOfScreen <= heightCenterSize) {
        position = const Offset(0, 16.0);
        debugPrint('OffSetInfo: topRight');
      } else if (dxOfScreen <= widthCenterSize &&
          dyOfScreen < heightCenterSize) {
      } else if (dxOfScreen > widthCenterSize &&
          dyOfScreen > heightCenterSize) {
        position = const Offset(16.0, 16.0);
        debugPrint('OffSetInfo: bottomLeft');
      } else {
        debugPrint('OffSetInfo: default');

        ///  position = const Offset(10.0, -20.0);
      }
    }

    String url =
        'https://cdn.britannica.com/49/94449-050-ECB0E7C2/Angkor-Wat-temple-complex-Camb.jpg';
    void calculatorDraggable(
        double screenWidth, double screenHeight, double sizeDx, double sizeDy) {
      double widthCenterSizeOfDx = screenWidth / 2;
      double heightCenterSizeOfDy = screenHeight / 2;
      if (sizeDx > widthCenterSizeOfDx && sizeDy < heightCenterSizeOfDy) {
        // _dragOffset = Offset(width / 0.4, 0);
        _dragOffset = Offset(
            members.length == 1
                ? width / 0.4
                : members.length == 2
                    ? width / 0.72
                    : members.length == 3
                        ? width - 70.0
                        : width - 70.0,
            0);
        // _dragOffset = Offset(  width - 70, 0);
        // debugPrint('OffSetInfo: topRight');
        result = '$sizeDx';
      } else if (sizeDx > widthCenterSizeOfDx &&
          sizeDy > heightCenterSizeOfDy) {
        _dragOffset = Offset(
            members.length == 1
                ? width / 0.4
                : members.length == 2
                    ? width / 0.72
                    : members.length == 3
                        ? width - 70.0
                        : width - 70.0,
            height / 0.21);
        result = '$widthCenterSizeOfDx';
        debugPrint('OffSetInfo: bottomRight');
      } else if (sizeDx < widthCenterSizeOfDx &&
          sizeDy < heightCenterSizeOfDy) {
        debugPrint('OffSetInfo: topLeft');
        // _dragOffset = Offset(width - 80, height - 80);
        _dragOffset = const Offset(0, 0);
        result = '$widthCenterSizeOfDx';
      } else if (sizeDx < widthCenterSizeOfDx &&
          sizeDy >= heightCenterSizeOfDy) {
        _dragOffset = Offset(0, height / 0.21);
        result = '$widthCenterSizeOfDx';
        debugPrint('OffSetInfo: bottomLeft');
      } else {
        result = '$widthCenterSizeOfDx';
        _dragOffset = Offset(width - 80, height - 84);
      }
    }

    void startAnimation() {
      _animationController.forward();
    }

    void reverseAnimation() {
      debugPrint('reverseAnimation:');
      _animationController.reverse();
    }

    @override
    void dispose() {
      _animationController.dispose();
      super.dispose();
    }

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Positioned(
              left: _dragOffset.dx,
              top: _dragOffset.dy,
              child: GestureDetector(
                onPanStart: (_) {
                  setState(() {
                    _isDragging = true;

                    startAnimation();
                  });
                },
                onPanEnd: (_) {
                  setState(() {
                    _isDragging = false;

                    reverseAnimation();
                  });
                },
                onPanUpdate: (details) {
                  setState(() {
                    _dragOffset += details.delta;
                  });
                },
                child: SlideTransition(
                  position: _animation,
                  child: Draggable<String>(
                    dragAnchorStrategy: centerDragAnchorStrategy,
                    feedback: Container(
                      width: members.length == 3
                          ? screenWidth / 1.2
                          : members.length == 2
                              ? screenWidth / 1.8
                              : members.length == 1
                                  ? 106
                                  : screenWidth / 1.2,
                      height: 190,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: GestureDetector(
                          onTap: () {
                            Get.toNamed(Pages.testDraggableFloatWidget);
                          },
                          child: ListView.builder(
                            itemCount: members.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              {
                                return index.isEven
                                    ? Container(
                                        width: 106,
                                        height: 190,
                                        color: Colors.red,
                                      )
                                    : Container(
                                        width: 106,
                                        height: 190,
                                        color: Colors.greenAccent,
                                      );
                                // CachedImage(
                                //         url: url,
                                //       );
                              }
                            },
                          )),
                    ),
                    childWhenDragging: Container(),
                    onDragEnd: (details) {
                      setState(() {
                        calculatorDraggable(screenWidth, screenHeight,
                            details.offset.dx, details.offset.dy);
                      });
                    },
                    child: Container(
                      width: members.length == 3
                          ? screenWidth / 1.2
                          : members.length == 2
                              ? screenWidth / 1.8
                              : members.length == 1
                                  ? 106
                                  : screenWidth / 1.2,
                      height: 190,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: GestureDetector(
                          onTap: () {
                            Get.toNamed(Pages.testDraggableFloatWidget);
                          },
                          child: ListView.builder(
                            itemCount: members.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              {
                                return index.isEven
                                    ? Container(
                                        width: 106,
                                        height: 190,
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      )
                                    : Container(
                                        width: 106,
                                        height: 190,
                                        color: Colors.greenAccent,
                                      );
                                // CachedImage(
                                //         url: url,
                                //       );
                              }
                            },
                          )),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  Text(result),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(Pages.physicsCardDragDemo);
                    },
                    child: const Text('Click to other screen'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
