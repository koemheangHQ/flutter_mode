import 'package:flutter/material.dart';
import 'package:fluuter_model/core/extensions/int_exstension.dart';
import 'package:fluuter_model/core/themes/app_color.dart';

class WeatherModule extends StatelessWidget {
  const WeatherModule({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: ColorConstant.purpleColorOrderStatus,
      // appBar: AppBar(
      //   elevation: 0.0,
      //   backgroundColor: ColorConstant.purpleColorOrderStatus,
      // ),
      body: Stack(
        children: [
          Container(
            width: screenSize.width,
            height: screenSize.height,
            color: Colors.transparent,
          ),
          Container(
            width: screenSize.width,
            height: screenSize.height / 1.8,
            decoration: const BoxDecoration(
              color: ColorConstant.purpleColorOrderStatus,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50.0),
                bottomRight: Radius.circular(50.0),
              ),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0XFF0052D4),
                  Color(0XFF65C7F7),

                  // Color(0XFF6190E8),
                  // Color(0XFFA7BFE8),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                50.height,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.location_city),
                    12.width,
                    const Text(
                      'Phnom Penh',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                12.height,
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Colors.transparent,
                    //border: Border.all(color: ColorConstant.white),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.local_fire_department_outlined),
                      12.width,
                      const Text(
                        'Partly cloudy',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      )
                    ],
                  ),
                ),
                12.height,
                const SizedBox(
                  child: Icon(
                    Icons.cloud,
                    size: 100,
                    color: ColorConstant.white,
                  ),
                ),
                const Text(
                  '21 C',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 52.0,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  'Thunderstorm',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24.0,
                    color: Colors.white,
                  ),
                ),
                6.height,
                const Text(
                  '03-Oct-2023',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
                12.height,
                const Divider(
                  color: ColorConstant.white,
                  endIndent: 6.0,
                  indent: 6.0,
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 24.0),
                  width: screenSize.width,
                  height: 100,
                  color: Colors.transparent,
                  child: Center(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Container(
                          width: screenSize.width / 4.5,
                          height: 100.0,
                          color: Colors.transparent,
                          // color: index.isEven ? Colors.blue : Colors.yellow,
                        );
                      },
                    ),
                  ),
                ),
                24.height,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
