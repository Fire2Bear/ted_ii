import 'package:TEDii/components/common/labeled_radio.dart';
import 'package:TEDii/enums/place_of_meal_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MealPlaceSelector extends StatefulWidget {
  final void Function(String place) callbackChangePlace;
  final String currentPlace;
  final Color activeColor;

  MealPlaceSelector({
    @required this.callbackChangePlace,
    this.currentPlace,
    this.activeColor,
  });

  @override
  _MealPlaceSelectorState createState() => _MealPlaceSelectorState();
}

class _MealPlaceSelectorState extends State<MealPlaceSelector> {
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
            label: PlaceOfMeal.CHEZ_MOI,
            value: PlaceOfMeal.CHEZ_MOI,
            groupValue: widget.currentPlace,
            onChanged: widget.callbackChangePlace,
          ),
          LabeledRadio(
            activeColor: widget.activeColor ?? Colors.green,
            padding: EdgeInsets.all(0),
            hideCircle: true,
            label: PlaceOfMeal.RESTAURANT,
            value: PlaceOfMeal.RESTAURANT,
            groupValue: widget.currentPlace,
            onChanged: widget.callbackChangePlace,
          ),
          LabeledRadio(
            activeColor: widget.activeColor ?? Colors.green,
            padding: EdgeInsets.all(0),
            hideCircle: true,
            label: PlaceOfMeal.CHEZ_DES_AMIS,
            value: PlaceOfMeal.CHEZ_DES_AMIS,
            groupValue: widget.currentPlace,
            onChanged: widget.callbackChangePlace,
          ),
          LabeledRadio(
            activeColor: widget.activeColor ?? Colors.green,
            padding: EdgeInsets.all(0),
            hideCircle: true,
            label: PlaceOfMeal.AU_TRAVAIL,
            value: PlaceOfMeal.AU_TRAVAIL,
            groupValue: widget.currentPlace,
            onChanged: widget.callbackChangePlace,
          ),
        ]);
  }
}
