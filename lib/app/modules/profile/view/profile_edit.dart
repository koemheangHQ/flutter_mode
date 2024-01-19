import 'package:flutter/material.dart';
import 'package:fluuter_model/core/themes/app_color.dart';
import 'package:fluuter_model/core/utils/circle_button.dart';

class ProfileEdit extends StatelessWidget {
  const ProfileEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Profile picture",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                ),
                CircleButton(
                  background: ColorConstant.white,
                  circularInkWell: 6.0,
                  circularMaterial: 6.0,
                  containerWidth: 6.0,
                  width: 50.0,
                  iconData: const Text("Edit"),
                  onTap: () {

                  },
                ),
              ],
            ),
            const CircleAvatar(
              radius:70.0,
              backgroundImage: NetworkImage(
                  'https://i.ibb.co/RNCkztc/PIA24343-03-Mars-Perseverance-Landing-Graphics-Orange-Rover.webp'),
            ),
            const Divider(
              height: 20.0,
              thickness:0.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Avatar",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                ),
                CircleButton(
                  background: ColorConstant.white,
                  circularInkWell: 6.0,
                  circularMaterial: 6.0,
                  containerWidth: 6.0,
                  width: 50.0,
                  iconData: const Text("Edit"),
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
