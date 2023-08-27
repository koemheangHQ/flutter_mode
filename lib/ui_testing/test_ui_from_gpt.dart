import 'package:flutter/material.dart';

class DraggableVideoCall extends StatefulWidget {
  @override
  _DraggableVideoCallState createState() => _DraggableVideoCallState();
}

class _DraggableVideoCallState extends State<DraggableVideoCall>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;
  bool _isDragging = false;
  Offset _dragOffset = Offset(0, 0);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, 1),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _startAnimation() {
    _animationController.forward();
  }

  void _reverseAnimation() {
    _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Draggable Video Call'),
        ),
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          final constraintsSize = constraints.maxWidth - 16;
          final widthScreen = MediaQuery.of(context).size.width;
          debugPrint('constraintsSize: $constraintsSize');
          debugPrint('widthScreen: $widthScreen');
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.red,
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.yellow,
                )
              ],
            ),
          );
          //   Stack(
          //   children: [
          //     Positioned(
          //       left: _isDragging ? _dragOffset.dx : 0,
          //       top: _isDragging ? _dragOffset.dy : 0,
          //       child: GestureDetector(
          //         onPanStart: (_) {
          //           setState(() {
          //             _isDragging = true;
          //             _startAnimation();
          //           });
          //         },
          //         onPanEnd: (_) {
          //           setState(() {
          //             _isDragging = false;
          //             _reverseAnimation();
          //           });
          //         },
          //         onPanUpdate: (details) {
          //           setState(() {
          //             _dragOffset += details.delta;
          //           });
          //         },
          //         child: SlideTransition(
          //           position: _animation,
          //           child: Draggable(
          //             child: Container(
          //               width: 200,
          //               height: 200,
          //               decoration: BoxDecoration(
          //                 color: Colors.blue,
          //                 borderRadius: BorderRadius.circular(10),
          //               ),
          //             ),
          //             feedback: Container(
          //               width: 200,
          //               height: 200,
          //               decoration: BoxDecoration(
          //                 color: Colors.blue.withOpacity(0.7),
          //                 borderRadius: BorderRadius.circular(10),
          //               ),
          //             ),
          //             childWhenDragging: Container(),
          //             onDragEnd: (details) {
          //               setState(() {
          //                 _dragOffset = details.offset;
          //               });
          //             },
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // );
        }));
  }
}
