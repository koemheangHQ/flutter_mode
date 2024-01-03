import 'package:flutter/material.dart';

class AvatarProfile extends StatelessWidget {
  const AvatarProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blueAccent,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      padding: const EdgeInsets.all(2),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50.0),
        child: Image.network(
          'https://i.ibb.co/RNCkztc/PIA24343-03-Mars-Perseverance-Landing-Graphics-Orange-Rover.webp',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}