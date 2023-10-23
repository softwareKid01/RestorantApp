import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget{
  const FilterScreen({super.key, required this.currentFilters});

  final Map<String,bool>currentFilters;

  @override
  State<StatefulWidget> createState() {
    return _FilterScreenState();
  }


}



class _FilterScreenState extends State<FilterScreen>{

var _glutenFreeFilterSet = false;
    var _lactoseFreeFilterSet = false;

    var _vegetarianFilterSet = false;
    var _veganFilterSet = false;

@override
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.currentFilters["glutenFree"]!;
_lactoseFreeFilterSet = widget.currentFilters["lactoseFree"]!;
_vegetarianFilterSet = widget.currentFilters["vegetarian"]!;
_veganFilterSet = widget.currentFilters["vegan"]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            "glutenFree":_glutenFreeFilterSet,
            "lactoseFree":_lactoseFreeFilterSet,
            "vegetarian":_vegetarianFilterSet,
            "vegan":_veganFilterSet
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFilterSet,
               onChanged: (isChecked){
                setState(() {
                  _glutenFreeFilterSet = isChecked;
                });
               },
               title: Text('Gluten-free',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground
               ),
               ),
               subtitle: Text('Only inlude gluten-free meals',style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,),
               ),
               activeColor: Theme.of(context).colorScheme.tertiary,
               contentPadding: const EdgeInsets.only(left: 34,right: 22),
            ),
             SwitchListTile(
              value: _lactoseFreeFilterSet,
               onChanged: (isChecked){
                setState(() {
                  _lactoseFreeFilterSet = isChecked;
                });
               },
               title: Text('Lactose-free',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground
               ),
               ),
               subtitle: Text('Only inlude lactose-free meals',style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,),
               ),
               activeColor: Theme.of(context).colorScheme.tertiary,
               contentPadding: const EdgeInsets.only(left: 34,right: 22),
            ),
      
      
             SwitchListTile(
              value: _vegetarianFilterSet,
               onChanged: (isChecked){
                setState(() {
                  _vegetarianFilterSet = isChecked;
                });
               },
               title: Text('Vegetarian',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground
               ),
               ),
               subtitle: Text('Only inlude vegetarian meals',style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,),
               ),
               activeColor: Theme.of(context).colorScheme.tertiary,
               contentPadding: const EdgeInsets.only(left: 34,right: 22),
            ),
             SwitchListTile(
              value: _veganFilterSet,
               onChanged: (isChecked){
                setState(() {
                  _veganFilterSet = isChecked;
                });
               },
               title: Text('Vegan',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground
               ),
               ),
               subtitle: Text('Only inlude vegan meals',style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,),
               ),
               activeColor: Theme.of(context).colorScheme.tertiary,
               contentPadding: const EdgeInsets.only(left: 34,right: 22),
            ),
          ]
        ),
      ),
    );
  }

}