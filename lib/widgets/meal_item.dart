import 'package:flutter/material.dart';
import 'package:meal_app2/model/meal.dart';
import 'package:transparent_image/transparent_image.dart';

import 'MealItemTrait.dart';

class MealItem extends StatelessWidget{
MealItem({required this.meal,required this.onSelectMeal,super.key});

final Meal meal;
final void Function(Meal meal) onSelectMeal;

  @override
  Widget build(BuildContext context) {

    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: (){
          onSelectMeal(meal);
        },
        child: Stack(
          children: [
            FadeInImage(placeholder: MemoryImage(kTransparentImage),
             image: NetworkImage(meal.imageUrl),
             ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: EdgeInsets.symmetric(vertical: 6,horizontal: 44),
                child: Column(children: [
                  Text(
                  meal.title,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  ),
                  const SizedBox(height:12),
                  Row(children: [
                    MealItemTrait(duration: "${meal.duration} min", icon: Icons.schedule,)
                  ],)
                ]),
              ),
              )
          ],
        ),
      ),
    );
  }
}