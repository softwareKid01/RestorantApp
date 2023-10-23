import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app2/providers/favorites_provider.dart';
import '../model/meal.dart';


class MealDetailScreen extends ConsumerWidget{
  MealDetailScreen({super.key, 
  required this.meal,
 
  });

final Meal meal;



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.star),
            tooltip: 'Open shopping cart',
            onPressed: () {
             ref.read(favoriteMealsProvider.notifier)
             .toggleMealFavoriteStatus(meal);
            },
          ),
        ],
      ),
    );
  }
}