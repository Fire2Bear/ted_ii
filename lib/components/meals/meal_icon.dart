import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tedii/utils/utils_service.dart';

// ignore: must_be_immutable
class MealIcon extends StatelessWidget {
  IconData icon;
  String name;
  int mealType;

  int currentMealType;
  void Function(int mealType) callBack;

  MealIcon(
      {@required callBack,
      icon: Icon,
      name: String,
      mealType: int,
      currentMealType: int}) {
    this.icon = icon;
    this.name = name;
    this.mealType = mealType;
    this.callBack = callBack;
    this.currentMealType = currentMealType;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: (currentMealType == mealType)
            ? BoxDecoration(
                color: hexToColor("#E2ECD1"),
                borderRadius: BorderRadius.circular(20))
            : BoxDecoration(),
        child: FlatButton(
            onPressed: () {
              this.callBack(this.mealType);
            },
            child: Column(
              children: <Widget>[
                Icon(
                  this.icon,
                  size: 30,
                ),
                Text(this.name)
              ],
            )));
  }
}
