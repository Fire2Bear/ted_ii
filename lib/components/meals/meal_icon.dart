import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class MealIcon extends StatelessWidget {
  IconData icon;
  String name;
  int mealType;

  MealIcon({icon: Icon, name: String, mealType: int}) {
    this.icon = icon;
    this.name = name;
    this.mealType = mealType;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FlatButton(
            onPressed: () {
              // TODO Choose meal
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
