import 'package:TEDii/components/common/labeled_radio.dart';
import 'package:TEDii/enums/physical_state_of_meal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MealPhysicalStateSelector extends StatefulWidget {
  final void Function(String place) callbackChangePhysicalState;
  final String currentPhysicalState;
  final Color activeColor;

  MealPhysicalStateSelector({
    @required this.callbackChangePhysicalState,
    this.currentPhysicalState,
    this.activeColor,
  });

  @override
  _MealPhysicalStateSelectorState createState() =>
      _MealPhysicalStateSelectorState();
}

class _MealPhysicalStateSelectorState extends State<MealPhysicalStateSelector> {
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
            label: PhysicalStateOfMeal.BALLONEMENT,
            value: PhysicalStateOfMeal.BALLONEMENT,
            groupValue: widget.currentPhysicalState,
            onChanged: widget.callbackChangePhysicalState,
          ),
          LabeledRadio(
            activeColor: widget.activeColor ?? Colors.green,
            padding: EdgeInsets.all(0),
            hideCircle: true,
            label: PhysicalStateOfMeal.CONSTIPATION,
            value: PhysicalStateOfMeal.CONSTIPATION,
            groupValue: widget.currentPhysicalState,
            onChanged: widget.callbackChangePhysicalState,
          ),
          LabeledRadio(
            activeColor: widget.activeColor ?? Colors.green,
            padding: EdgeInsets.all(0),
            hideCircle: true,
            label: PhysicalStateOfMeal.DIARRHEE,
            value: PhysicalStateOfMeal.DIARRHEE,
            groupValue: widget.currentPhysicalState,
            onChanged: widget.callbackChangePhysicalState,
          ),
          LabeledRadio(
            activeColor: widget.activeColor ?? Colors.green,
            padding: EdgeInsets.all(0),
            hideCircle: true,
            label: PhysicalStateOfMeal.GAZ,
            value: PhysicalStateOfMeal.GAZ,
            groupValue: widget.currentPhysicalState,
            onChanged: widget.callbackChangePhysicalState,
          ),
        ]);
  }
}
