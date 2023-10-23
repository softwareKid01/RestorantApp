import 'package:flutter/material.dart';
import 'package:meal_app2/data/dummyData.dart';
import 'package:meal_app2/widgets/categoryGridItem.dart';

import '../model/meal.dart';
import '../model/model.dart';
import 'mealsScreen.dart';

class CategoriesScreen extends StatelessWidget{

CategoriesScreen({super.key,
required this.availableMeals
});

final List<Meal> availableMeals;



void _selectCategory(BuildContext context,Category category){
  final filteredData = availableMeals.where((meal) => meal.categories.contains(category.id)).toList();
  Navigator.push(context, MaterialPageRoute(builder: (context)=> 
  MealsScreen(title: category.title,
  meals: filteredData)));
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
        body: GridView(
          padding: EdgeInsets.all(15),
          gridDelegate: const 
          SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20 
              ),
          children: [
            for(Category category in availableCategories)
              CategoryGridItem(
                category: category,
                onSelectedCategory:(){_selectCategory(context,category);},
                )
            
          ],
        ),
    );
  }
}