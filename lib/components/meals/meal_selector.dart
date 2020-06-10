import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tedii/components/icons/tedii_icons_icons.dart';
import 'package:tedii/components/meals/meal_icon.dart';

class MealSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
//              Expanded(child: MealIcon(icon: Icon(Icons.free_breakfast), name: "Petit-Dèj")),
          Expanded(
              child: MealIcon(
                  icon: Icons.free_breakfast, name: "Petit-Dèj", mealType: 0)),
          Expanded(
              child: MealIcon(
                  icon: TediiIcons.food, name: "Déjeuner", mealType: 1)),
          Expanded(
              child:
                  MealIcon(icon: Icons.fastfood, name: "Diner", mealType: 2)),
          Expanded(
              child: MealIcon(
                  icon: Icons.free_breakfast, name: "Encas", mealType: 3)),
        ],
      ),
    );
  }
}
