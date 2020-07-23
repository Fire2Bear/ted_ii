import 'package:TEDii/components/common/labeled_radio.dart';
import 'package:TEDii/enums/during_time_of_meal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MealDuringTimeSelector extends StatefulWidget {
  final void Function(String place) callbackChangeDuringTime;
  final String currentDuringTime;
  final Color activeColor;

  MealDuringTimeSelector({
    @required this.callbackChangeDuringTime,
    this.currentDuringTime,
    this.activeColor,
  });

  @override
  _MealDuringTimeSelectorState createState() => _MealDuringTimeSelectorState();
}

class _MealDuringTimeSelectorState extends State<MealDuringTimeSelector> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisSpacing: 2,
        childAspectRatio: 6,
        padding: EdgeInsets.all(0),
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        children: <Widget>[
          LabeledRadio(
            activeColor: widget.activeColor ?? Colors.green,
            padding: EdgeInsets.all(0),
            hideCircle: true,
            label: DuringTimeOfMeal.INF_15,
            value: DuringTimeOfMeal.INF_15,
            groupValue: widget.currentDuringTime,
            onChanged: widget.callbackChangeDuringTime,
          ),
          LabeledRadio(
            activeColor: widget.activeColor ?? Colors.green,
            padding: EdgeInsets.all(0),
            hideCircle: true,
            label: DuringTimeOfMeal.BET_40_60,
            value: DuringTimeOfMeal.BET_40_60,
            groupValue: widget.currentDuringTime,
            onChanged: widget.callbackChangeDuringTime,
          ),
          LabeledRadio(
            activeColor: widget.activeColor ?? Colors.green,
            padding: EdgeInsets.all(0),
            hideCircle: true,
            label: DuringTimeOfMeal.BET_15_40,
            value: DuringTimeOfMeal.BET_15_40,
            groupValue: widget.currentDuringTime,
            onChanged: widget.callbackChangeDuringTime,
          ),
          LabeledRadio(
            activeColor: widget.activeColor ?? Colors.green,
            padding: EdgeInsets.all(0),
            hideCircle: true,
            label: DuringTimeOfMeal.SUP_60,
            value: DuringTimeOfMeal.SUP_60,
            groupValue: widget.currentDuringTime,
            onChanged: widget.callbackChangeDuringTime,
          ),
        ]);
  }
}
