import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HandleStatusBar extends StatefulWidget {
  const HandleStatusBar({super.key});

  @override
  State<HandleStatusBar> createState() => _HandleStatusBarState();
}

class _HandleStatusBarState extends State<HandleStatusBar> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.yellow,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    // SystemChrome.setSystemUIOverlayStyle(
    //   const SystemUiOverlayStyle(
    //     statusBarColor: Colors.purple,
    //     statusBarIconBrightness: Brightness.light,
    //     // statusBarColor: Colors.yellow,
    //     // statusBarColor: Colors.deepPurpleAccent,
    //   ),
    // );
    // final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.teal,
      //   // systemOverlayStyle: SystemUiOverlayStyle.light,
      //   //Brightness.light = Dark icon
      //   //Brghtness.dark = Light icon
      // ),
      body: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Woolha.com - One',
                style: TextStyle(color: Colors.black)),
            OutlinedButton(
              child: const Text('Go to PageTwo'),
              onPressed: () {
                Navigator.popAndPushNamed(context, "/two");
              },
            ),
          ],
        ),
      ),
      // Container(
      //   width: screenSize.width,
      //   height: screenSize.height,
      //   color: Colors.redAccent,
      //   child: Container(
      //     height: 48.0,
      //     color: Colors.redAccent,
      //     // child:
      //     // ElevatedButton(
      //     //   child: const Text('Toggle Change'),
      //     //   onPressed: () {
      //     //     SystemChrome.setSystemUIOverlayStyle(
      //     //         SystemUiOverlayStyle.dark); // 2
      //     //   },
      //   ),
      //   // ),
      // ),
    );
  }
}
