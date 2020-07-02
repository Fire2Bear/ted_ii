import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tedii/components/icons/tedii_icons_icons.dart';
import 'package:tedii/components/meals/meal_icon.dart';

class MealSelector extends StatelessWidget {
  final void Function(int mealType) callBackChangeMeal;

  final int currentMealType;

  MealSelector({@required this.callBackChangeMeal, this.currentMealType});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
              child: MealIcon(
            callBack: this.callBackChangeMeal,
            icon: Icons.free_breakfast,
            name: "Petit-Dèj",
            mealType: 0,
            currentMealType: this.currentMealType,
          )),
          Expanded(
              child: MealIcon(
                callBack: this.callBackChangeMeal,
                icon: TediiIcons.food,
                name: "Déjeuner",
                mealType: 1,
                currentMealType: this.currentMealType,
              )),
          Expanded(
              child: MealIcon(
                callBack: this.callBackChangeMeal,
                icon: Icons.fastfood,
                name: "Diner",
                mealType: 2,
                currentMealType: this.currentMealType,
              )),
          Expanded(
              child: MealIcon(
                callBack: this.callBackChangeMeal,
                icon: Icons.free_breakfast,
                name: "Encas",
                mealType: 3,
                currentMealType: this.currentMealType,
              )),
        ],
      ),
    );
  }
}
