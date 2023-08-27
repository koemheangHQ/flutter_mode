import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class PhysicsCardDragDemo extends StatelessWidget {
  const PhysicsCardDragDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: DraggableCard(
        child: Container(
          alignment: Alignment.center,
          width: 318,
          height: 190.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              return Container(
                alignment: Alignment.center,
                width: 106.0,
                height: 190.0,
                color: index.isEven ? Colors.redAccent : Colors.greenAccent,
              );
            },
          ),
        ),
      ),
    );
  }
}

/// A draggable card that moves back to [Alignment.center] when it's
/// released.
class DraggableCard extends StatefulWidget {
  const DraggableCard({required this.child, super.key});

  final Widget child;

  @override
  State<DraggableCard> createState() => _DraggableCardState();
}

class _DraggableCardState extends State<DraggableCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  /// The alignment of the card as it is dragged or being animated.
  ///
  /// While the card is being dragged, this value is set to the values computed
  /// in the GestureDetector onPanUpdate callback. If the animation is running,
  /// this value is set to the value of the [_animation].
  Alignment _dragAlignment = Alignment.topRight;
  Alignment dragAlignmentEnd = Alignment.topRight;

  late Animation<Alignment> _animation;

  /// Calculates and runs a [SpringSimulation].
  void _runAnimation(Offset pixelsPerSecond, Size size) {
    _animation = _controller.drive(
      AlignmentTween(
        begin: _dragAlignment,
        end: dragAlignmentEnd,
      ),
    );
    // Calculate the velocity relative to the unit interval, [0,1],
    // used by the animation controller.
    final unitsPerSecondX = pixelsPerSecond.dx / size.width;
    final unitsPerSecondY = pixelsPerSecond.dy / size.height;
    final unitsPerSecond = Offset(unitsPerSecondX, unitsPerSecondY);
    final unitVelocity = unitsPerSecond.distance;

    const spring = SpringDescription(
      mass: 30,
      stiffness: 1,
      damping: 1,
    );

    final simulation = SpringSimulation(spring, 0, 1, -unitVelocity);

    _controller.animateWith(simulation);
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);

    _controller.addListener(
      () {
        setState(
          () {
            _dragAlignment = _animation.value;
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onPanDown: (details) {
        _controller.stop();
      },
      onPanUpdate: (details) {
        setState(
          () {
            calculator(details.globalPosition.dx, details.globalPosition.dy,
                size.width, size.height);
            _dragAlignment += Alignment(
              details.delta.dx / (size.width / 3),
              details.delta.dy / (size.height / 3),
            );
          },
        );
      },
      onPanEnd: (details) {
        _runAnimation(details.velocity.pixelsPerSecond, size);
      },
      child: Align(
        widthFactor: 16.0,
        heightFactor: 16.0,
        alignment: _dragAlignment,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            child: widget.child,
          ),
        ),
      ),
    );
  }

  void calculator(double globalDx, double globalDy, double screenWidth,
      double screenHeight) {
    double tempDx = screenWidth / 2;
    double tempDy = screenHeight / 2;
    if (globalDx < tempDx && globalDy <= tempDy) {
      dragAlignmentEnd = Alignment.topLeft;
    } else if (globalDx >= tempDx && globalDy <= tempDy) {
      dragAlignmentEnd = Alignment.topRight;
    } else if (globalDx <= tempDx && globalDy >= tempDy) {
      dragAlignmentEnd = Alignment.bottomLeft;
    } else if (globalDx > tempDx && globalDy >= globalDy) {
      dragAlignmentEnd = Alignment.bottomRight;
    }
  }
}
