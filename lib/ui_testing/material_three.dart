import 'package:flutter/material.dart';
import 'package:fluuter_model/core/tools/app_size.dart';

class MaterialThree extends StatefulWidget {
  const MaterialThree({super.key});

  @override
  State<MaterialThree> createState() => _MaterialThreeState();
}

class _MaterialThreeState extends State<MaterialThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: AppSize.initializeWidth(context),
        height: AppSize.initializeHeight(context),
        color: Colors.red,
      ),
    );
  }
}
