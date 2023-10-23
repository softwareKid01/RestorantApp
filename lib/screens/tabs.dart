import 'package:flutter/material.dart';
import 'package:meal_app2/data/dummyData.dart';
import 'package:meal_app2/providers/favorites_provider.dart';
import 'package:meal_app2/screens/categories.dart';
import 'package:meal_app2/screens/filters.dart';
import 'package:meal_app2/screens/mealsScreen.dart';
import 'package:meal_app2/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/meal.dart';

const kInitialFilters = {

   "glutenFree":false,
   "lactoseFree":false,
   "vegetarian":false,
  "vegan":false

};

class TabsScreen extends ConsumerStatefulWidget{
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _TabsScreenState();
  }

  
}

class _TabsScreenState extends ConsumerState<TabsScreen>{
int _selectedPageIndex = 0;


Map<String,bool>_selectedFilters = kInitialFilters;


void _selectPage(int index){
  setState(() {
    _selectedPageIndex = index;
  });
}

void _setScreen(String identifier)async{
  if(identifier == "filters"){
final result = await Navigator.of(context).push<Map<String,bool>>
(MaterialPageRoute(builder: (ctx)=> FilterScreen(currentFilters: _selectedFilters,)));
  
  
  setState(() {
    _selectedFilters = result ?? kInitialFilters;
  });


  }else{
Navigator.of(context).pop();
  }

  
  
}

  @override
  Widget build(BuildContext context) {

final availableMeals = dummyMeals.where((meal) {
if(_selectedFilters["glutenFree"]! && !meal.isGlutenFree){
return false;
}
if(_selectedFilters["lactoseFree"]! && !meal.isLactoseFree){
return false;
}
if(_selectedFilters["vegetarian"]! && !meal.isVegetarian){
return false;
}
if(_selectedFilters["vegan"]! && !meal.isVegan){
return false;
}
return true;
}).toList();

    Widget activeScreen = CategoriesScreen(availableMeals: availableMeals);
    var activeScreenTitle = 'Cateegories';

if(_selectedPageIndex ==1){
  final favoriteMeals = ref.watch(favoriteMealsProvider);
  activeScreen =  MealsScreen(meals: favoriteMeals,);
  activeScreenTitle = 'Favorites';
}

    return Scaffold(
      appBar: AppBar(
        title: Text(activeScreenTitle),
      ),
      drawer: MainDrawer(onSelectedScreen: _setScreen),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal),label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star),label: "Favorites"),
        ]),
    );
  }

}