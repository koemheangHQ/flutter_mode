import 'package:flutter/material.dart';

class TestModel extends StatefulWidget {
  const TestModel({super.key});

  @override
  State<TestModel> createState() => _TestModelState();
}

class _TestModelState extends State<TestModel>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  late Animation<Offset> animation;
  late Offset position;
  late Offset dragOffset;
  bool _isDragging = false;
  double globalPositionDx = 0.0;
  double globalPositionDy = 0.0;

  @override
  void initState() {
    position = const Offset(0, 0);
    dragOffset = const Offset(0, 0);
    animationController = AnimationController(
      duration: const Duration(minutes: 1),
      vsync: this,
    );
    animation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(1.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOutBack,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;
    debugPrint("Information-=-=-=-=>  on build width : $screenWidth");
    debugPrint("Information-=-=-=-=> on build  height : $screenHeight");
    void startAnimation() {
      animationController.forward();
    }

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

    void reverseAnimation() {
      debugPrint('reverseAnimation:');
      animationController.reverse();
    }

    void calculatorDraggable(
        double screenWidth, double screenHeight, double sizeDx, double sizeDy) {
      double widthCenterSizeOfDx = screenWidth / 2;
      double heightCenterSizeOfDy = screenHeight / 2;
      if (sizeDx > widthCenterSizeOfDx && sizeDy < heightCenterSizeOfDy) {
        // _dragOffset = Offset(width / 0.4, 0);
        dragOffset = Offset(
            members.length == 1
                ? screenSize.width / 0.4
                : members.length == 2
                    ? screenSize.width / 0.72
                    : members.length == 3
                        ? screenSize.width - 70.0
                        : screenSize.width - 70.0,
            0);
        // _dragOffset = Offset(  width - 70, 0);
        // debugPrint('OffSetInfo: topRight');
        // result = '$sizeDx';
      } else if (sizeDx > widthCenterSizeOfDx &&
          sizeDy > heightCenterSizeOfDy) {
        dragOffset = Offset(
            members.length == 1
                ? screenSize.width / 0.4
                : members.length == 2
                    ? screenSize.width / 0.72
                    : members.length == 3
                        ? screenSize.width - 70.0
                        : screenSize.width - 70.0,
            screenSize.height / 0.21);
        // result = '$widthCenterSizeOfDx';
        debugPrint('OffSetInfo: bottomRight');
      } else if (sizeDx < widthCenterSizeOfDx &&
          sizeDy < heightCenterSizeOfDy) {
        debugPrint('OffSetInfo: topLeft');
        // _dragOffset = Offset(width - 80, height - 80);
        dragOffset = const Offset(0, 0);
        // result = '$widthCenterSizeOfDx';
      } else if (sizeDx < widthCenterSizeOfDx &&
          sizeDy >= heightCenterSizeOfDy) {
        dragOffset = Offset(0, screenSize.width / 0.21);
        // result = '$widthCenterSizeOfDx';
        debugPrint('OffSetInfo: bottomLeft');
      } else {
        // result = '$widthCenterSizeOfDx';
        dragOffset = Offset(screenSize.width - 80, screenSize.height - 84);
      }
    }

    return Scaffold(
      backgroundColor: Colors.red,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50.0,
                color: Colors.blueGrey,
              ),
            ],
          ),
          Positioned(
            top: 50.0,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.blue,
              child: Stack(
                children: [
                  Positioned(
                    left: dragOffset.dx,
                    top: dragOffset.dy,
                    child: GestureDetector(
                      onPanEnd: (details) {
                        debugPrint("Information details : $details");
                        reverseAnimation();
                      },
                      onPanStart: (details) {
                        debugPrint(
                            "Information details -=-=-=-=-=-=-==--=-=---=::::: ${details.globalPosition.dx}  and details delta dy: ${details.globalPosition.dy}");
                        startAnimation();
                      },
                      onPanUpdate: (details) {
                        globalPositionDx = details.globalPosition.dx;
                        globalPositionDy = details.globalPosition.dy;

                        setState(() {
                          dragOffset += details.delta;
                        });
                        calculatorDxDy(
                          globalPositionDx,
                          globalPositionDy,
                          screenWidth,
                          screenHeight,
                        );
                      },
                      child: Container(
                        color: Colors.yellow,
                        width: 160,
                        height: 190.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void calculatorDxDy(double screenWidth, double screenHeight,
      double getGlobalDx, double getGlobalDy) {
    double tempDx = screenWidth / 2;
    double tempDy = screenHeight / 2;
    debugPrint("Information-=-=-=-=> width : $screenWidth");
    debugPrint("Information-=-=-=-=> height : $screenHeight");
    debugPrint("Information-=-=-=-=> tempDx : $tempDx");
    debugPrint("Information-=-=-=-=> tempDy : $tempDy");
    debugPrint("Information-=-=-=-=> getGlobalDx : $getGlobalDx");
    debugPrint("Information-=-=-=-=> getGlobalDy : $getGlobalDy");
    if (getGlobalDx < tempDx && getGlobalDy < tempDy) {
      debugPrint('topLeft');
    } else if (getGlobalDx > tempDx && getGlobalDy < tempDy) {
      debugPrint('topRight');
    } else if (getGlobalDx < tempDx && getGlobalDy > tempDy) {
      debugPrint('bottomLeft');
    } else if (getGlobalDx < tempDx && getGlobalDy > tempDy) {
      debugPrint('bottomRight');
    } else {
      debugPrint('initial global position ');
    }
  }
}
