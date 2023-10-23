import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget{
MealItemTrait({super.key,
required this.icon,
required this.duration}
);

final String duration;
final IconData icon;
  @override
  Widget build(BuildContext context) {
  return Row(
    children: [
      Icon(
     icon,
     size: 17,
     color: Colors.white,
      ),
      SizedBox(width: 6),
      Text(
        duration,
      style: TextStyle(
        color: Colors.white
      ),
      )
    ],
  );
  }
}