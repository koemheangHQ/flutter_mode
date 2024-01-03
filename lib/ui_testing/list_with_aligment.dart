import 'package:flutter/material.dart';

class ListWithAlignment extends StatefulWidget {
  const ListWithAlignment({super.key});

  @override
  State<ListWithAlignment> createState() => _ListWithAlignmentState();
}

class _ListWithAlignmentState extends State<ListWithAlignment> {
  List<String> res = ['1', '2', '3', '4'];
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body:
          /*
      Container(
        alignment: Alignment.topCenter,
        width: screenSize.width,
        height: screenSize.height,
        color: Colors.teal,
        child: Wrap(
          alignment: WrapAlignment.center,
          children: List.generate(
            3,
            (index) => Container(
              margin: const EdgeInsets.all(6.0),
              width: MediaQuery.of(context).size.width * .42,
              // width: MediaQuery.of(context).size.width * .4,
              height: 190,
              color: Colors.lightGreen,
            ),
          ),
        ),
        */
          Container(
        margin: const EdgeInsets.all(12.0),
        width: res.length == 1
            ? 106
            : res.length == 2
                ? 212
                : 318,
        height: 190,
        decoration: BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: index.isEven ? Colors.blue : Colors.blueGrey,
                    borderRadius: index == 0 || (index == res.length - 1)
                        ? BorderRadius.only(
                            topRight: index == 0
                                ? const Radius.circular(0.0)
                                : (index == res.length - 1)
                                    ? const Radius.circular(12.0)
                                    : const Radius.circular(0.0))
                        : BorderRadius.circular(0),
                  ),
                  width: 106.0,
                  height: 190.0,
                );
              },
              separatorBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.only(right: 0.0),
                );
              },
              itemCount: res.length),
        ),
      ),
    );
  }
}
