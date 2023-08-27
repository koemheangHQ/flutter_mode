import 'dart:async';

import 'package:draggable_float_widget/draggable_float_widget.dart';
import 'package:flutter/material.dart';

/// root page of test
class TestDraggableFloatWidget extends StatefulWidget {
  const TestDraggableFloatWidget({super.key});

  @override
  State<StatefulWidget> createState() => _TestDraggableFloatState();
}

class _TestDraggableFloatState extends State<TestDraggableFloatWidget> {
  static const double bottomBarHeight = 50;
  late StreamController<OperateEvent> eventStreamController;

  int _selectedIndex = 0;
  List<Widget> pages = [];
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    eventStreamController = StreamController.broadcast();
    pages
      ..add(
        StackModePage(
          listView: defaultList,
          navigatorBarHeight: bottomBarHeight,
          eventStreamController: eventStreamController,
          child: Container(
            color: Colors.greenAccent,
          ),
        ),
      )
      ..add(
        OverlayModePage(
          listView: defaultList,
          navigatorBarHeight: bottomBarHeight,
          eventStreamController: eventStreamController,
          child: Container(
            width: 250.0,
            height: 250.0,
            color: Colors.red,
          ),
        ),
      );
  }

  Widget get defaultDragWidget => Container(
        // width: 150.0,
        // height: 260.0,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(15),
        ),
        // alignment: Alignment.center,
        // padding: const EdgeInsets.all(5),
        // child: const Material(
        //   color: Colors.transparent,
        //   child: Text(
        //     "Drag\nWidget",
        //     style: TextStyle(
        //       fontSize: 15,
        //       color: Colors.white,
        //       fontWeight: FontWeight.bold,
        //     ),
        //     textAlign: TextAlign.center,
        //   ),
        // ),
      );

  Widget get defaultList => Container(
        alignment: Alignment.center,
        child: NotificationListener(
          onNotification: (notification) {
            if (notification is ScrollStartNotification) {
              eventStreamController.add(OperateEvent.OPERATE_HIDE);
            } else if (notification is ScrollEndNotification) {
              eventStreamController.add(OperateEvent.OPERATE_SHOW);
            }
            return true;
          },
          child: ListView.builder(
            itemCount: Colors.accents.length,
            itemBuilder: (context, index) {
              Color _color = Colors.accents[index].shade100;
              String _strColor =
                  "Color(0x${_color.value.toRadixString(16).padLeft(8, '0')})";
              return Container(
                height: 50,
                color: _color,
                alignment: Alignment.center,
                child: Text(
                  "$index. $_strColor",
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 13,
                  ),
                ),
              );
            },
          ),
        ),
      );

  @override
  void dispose() {
    eventStreamController.close();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: pages,
        controller: pageController,
        onPageChanged: (index) {
          if (mounted) setState(() => _selectedIndex = index);
        },
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: _buildBottomAppBar(),
    );
  }

  Widget _buildBottomAppBar() {
    return BottomAppBar(
      elevation: 0,
      child: Container(
        height: bottomBarHeight,
        child: BottomNavigationBar(
          items: [
            _navigationBarItem(
              Icons.view_compact_outlined,
              Icons.view_compact,
              "Stack",
            ),
            _navigationBarItem(
              Icons.amp_stories_outlined,
              Icons.amp_stories,
              "Overlay",
            ),
          ],
          elevation: 0,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          selectedItemColor: Colors.redAccent,
          unselectedItemColor: Colors.black54,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          backgroundColor: Colors.white,
          onTap: (index) => pageController.jumpToPage(index),
        ),
      ),
    );
  }

  BottomNavigationBarItem _navigationBarItem(
    IconData icon,
    IconData activeIcon,
    String label,
  ) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        size: 25,
        color: Colors.black54,
      ),
      activeIcon: Icon(
        activeIcon,
        size: 25,
        color: Colors.redAccent,
      ),
      label: label,
    );
  }
}

/// stack mode
class StackModePage extends StatelessWidget {
  final Widget child;
  final Widget listView;
  final double navigatorBarHeight;
  final StreamController<OperateEvent> eventStreamController;

  const StackModePage({
    Key? key,
    required this.child,
    required this.listView,
    required this.navigatorBarHeight,
    required this.eventStreamController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Stack Mode",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.grey,
      body: Stack(
        children: [
          listView,
          Positioned(
            left: 20.0,
            child: DraggableFloatWidget(
                width: MediaQuery.of(context).size.width / 2,
                height: 190.0,
                eventStreamController: eventStreamController,
                config: DraggableFloatWidgetBaseConfig(
                  borderLeft: 20.0,
                  borderRight: 20.0,
                  isFullScreen: false,
                  initPositionYInTop: false,
                  initPositionYMarginBorder: 0,
                  borderBottom: navigatorBarHeight + defaultBorderWidth,

                  // exposedPartWidthWhenHidden: 80.0,
                ),
                onTap: () {
                  debugPrint("Drag onTap!");
                },
                child: child
                // ListView.builder(
                //   scrollDirection: Axis.horizontal,
                //   itemCount: 4,
                //   itemBuilder: (context, index) {
                //     return Container(
                //       width: 108.0,
                //       height: 190.0,
                //       color: index.isEven ? Colors.red : Colors.greenAccent,
                //     );
                //   },
                // ),
                ),
          )
        ],
      ),
    );
  }
}

/// overlay mode
class OverlayModePage extends StatefulWidget {
  final Widget child;
  final Widget listView;
  final double navigatorBarHeight;
  final StreamController<OperateEvent> eventStreamController;

  const OverlayModePage({
    Key? key,
    required this.child,
    required this.listView,
    required this.navigatorBarHeight,
    required this.eventStreamController,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OverlayModeState();
}

class _OverlayModeState extends State<OverlayModePage> {
  OverlayEntry? _overlayEntry;
  bool _showDraggableFloat = false;

  @override
  void dispose() {
    _removePreviousOverlay();
    super.dispose();
  }

  _removePreviousOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Overlay Mode",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: InkWell(
              onTap: () {
                if (_showDraggableFloat) {
                  _removePreviousOverlay();
                } else {
                  _showOverlay();
                }
                setState(() {
                  _showDraggableFloat = !_showDraggableFloat;
                });
              },
              child: Icon(
                _showDraggableFloat
                    ? Icons.amp_stories_rounded
                    : Icons.amp_stories_outlined,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey,
      body: widget.listView,
    );
  }

  _showOverlay() {
    // 1. remove previous overlay
    _removePreviousOverlay();
    // 2. show new overlay
    _overlayEntry = OverlayEntry(builder: (context) {
      return DraggableFloatWidget(
        child: widget.child,
        eventStreamController: widget.eventStreamController,
        config: DraggableFloatWidgetBaseConfig(
          initPositionYInTop: false,
          initPositionYMarginBorder: 50,
          borderTopContainTopBar: true,
          borderBottom: widget.navigatorBarHeight + defaultBorderWidth,
        ),
        onTap: () => print("Drag onTap!"),
      );
    });

    /// Warning: context cannot be the context of MaterialApp
    Overlay.of(context)?.insert(_overlayEntry!);
  }
}
