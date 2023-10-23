import 'package:flutter/material.dart';

import '../model/meal.dart';
import '../widgets/meal_item.dart';
import 'MealDetailed.dart';

class MealsScreen extends StatelessWidget{

MealsScreen({
super.key, 
this.title,
required this.meals,

});

final String? title;
final List<Meal> meals;


void selectedMeal(BuildContext context,Meal meal){
Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => MealDetailScreen(meal: meal)));
}

  @override
  Widget build(BuildContext context) {
    Widget content =  Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Nothing here.....",
        style: Theme.of(context).textTheme.headlineLarge!.copyWith(
          color: Theme.of(context).colorScheme.onBackground
        )),
        const SizedBox(height:16),
        Text("Select other category",
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: Theme.of(context).colorScheme.onBackground
        )
        )
      ]),
        );

if(meals.isNotEmpty){
  content = ListView.builder(
    itemCount: meals.length,
    itemBuilder: (ctx,index) => 
   MealItem(meal: meals[index], onSelectMeal:(meal){
    selectedMeal(context, meal);
   })
   );
}

// if(title == null){
//   content;
// }

   return Scaffold(
      appBar: title != null
          ? AppBar(
              title: Text(title!),
            )
          : null, // Set the AppBar to null when title is null
      body: content,
    );
  }
}