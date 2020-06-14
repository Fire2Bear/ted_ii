import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:openfoodfacts/model/Product.dart';
import 'package:tedii/components/meals/time_selector.dart';
import 'package:tedii/models/meal_model.dart';

class MealDetails extends StatefulWidget {
  final Meal currentMeal;

  final void Function(Meal newMeal) callBack;

  MealDetails({@required this.currentMeal, @required this.callBack});

  @override
  _MealDetailsState createState() => _MealDetailsState();
}

class _MealDetailsState extends State<MealDetails> {
  List<Product> products;

  Meal currentMeal;

  void updateTime(TimeOfDay time) {
    currentMeal.time = time;
    setState(() {
      currentMeal = currentMeal;
    });
    widget.callBack(currentMeal);
  }

  @override
  Widget build(BuildContext context) {
    // on met à jour le repas courant avec celui passé en parametre
    if (currentMeal == null) {
      setState(() {
        currentMeal = widget.currentMeal;
      });
    }

    print("widget.currentMeal.foods");
    print(widget.currentMeal.foods);

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TimeSelector(this.widget.currentMeal.time, this.updateTime),
          Text(
            "Aliments",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height / 3),
            child: Container(
              color: Colors.lightGreen,
              child: ListView(
                padding: EdgeInsets.all(10.0),
//              itemCount: this.widget.currentMeal.foods.length,
                children: widget.currentMeal.foods.map((food) {
                  return Container(
                      height: 10,
                      child: ListTile(title: Text(food.productName)));
                }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
