import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        color: Colors.yellow,
      ),
    );
  }
}
