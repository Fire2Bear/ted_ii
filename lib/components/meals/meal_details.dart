import 'package:TEDii/components/meals/meal_during_time_selector.dart';
import 'package:TEDii/components/meals/meal_mood_selector.dart';
import 'package:TEDii/components/meals/meal_physical_state_selector.dart';
import 'package:TEDii/components/meals/meal_place_selector.dart';
import 'package:TEDii/components/meals/time_selector.dart';
import 'package:TEDii/enums/place_of_meal_enum.dart';
import 'package:TEDii/models/food_model.dart';
import 'package:TEDii/models/meal_model.dart';
import 'package:TEDii/screens/food_list_selection.dart';
import 'package:TEDii/utils/utils_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MealDetails extends StatefulWidget {
  final Meal currentMeal;

  final void Function(Meal newMeal) callBackSaveMeal;

  MealDetails({@required this.currentMeal, @required this.callBackSaveMeal});

  @override
  _MealDetailsState createState() => _MealDetailsState();
}

class _MealDetailsState extends State<MealDetails> {
  Meal currentMeal;

  void updateTime(TimeOfDay time) {
    currentMeal.time = time;
    setState(() {
      currentMeal = currentMeal;
    });
    widget.callBackSaveMeal(this.currentMeal);
  }

  void removeFood(Food food) {
    currentMeal.foods.remove(food);
    setState(() {
      currentMeal = currentMeal;
    });
    widget.callBackSaveMeal(this.currentMeal);
  }

  void changePlace(String place) {
    currentMeal.place = place;
    setState(() {
      currentMeal = currentMeal;
    });
    widget.callBackSaveMeal(this.currentMeal);
  }

  void changeDuringTime(String duringTime) {
    currentMeal.duringTime = duringTime;
    setState(() {
      currentMeal = currentMeal;
    });
    widget.callBackSaveMeal(this.currentMeal);
  }

  void changePhysicalState(String physicalState) {
    currentMeal.physicalState = physicalState;
    setState(() {
      currentMeal = currentMeal;
    });
    widget.callBackSaveMeal(this.currentMeal);
  }

  void changeMood(int mood) {
    currentMeal.mood = mood;
    setState(() {
      currentMeal = currentMeal;
    });
    widget.callBackSaveMeal(this.currentMeal);
  }

  @override
  Widget build(BuildContext context) {
    // on met à jour le repas courant avec celui passé en parametre
    if (currentMeal == null || currentMeal != widget.currentMeal) {
      setState(() {
        currentMeal = widget.currentMeal;
      });
    }

    return Container(
      padding: EdgeInsets.only(
        left: 10.0,
        right: 10.0,
      ),
      child: Column(
/*      crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,*/
        children: <Widget>[
          /// Heure du repas
          TimeSelector(widget.currentMeal.time, this.updateTime),

          /// Liste des aliments du repas
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 36.0),
                    child: Text(
                      "Aliments",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  Spacer(),
                  Container(
//                  color: Colors.green,
                    decoration: BoxDecoration(
//                    color: Colors.green,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: IconButton(
                      iconSize: 27,
                      padding: const EdgeInsets.only(right: 15.0),
                      onPressed: () async {
                        // Goto FoodListSelection
                        Food addedFood =
                            await Navigator.of(context).pushNamed<dynamic>(
                          FoodListSelection.routeName,
                        );
                        if (addedFood != null) {
                          currentMeal.foods.add(addedFood);
                          setState(() {
                            currentMeal = currentMeal;
                          });
                          widget.callBackSaveMeal(currentMeal);
                        }
                      },
                      icon: Icon(
                        Icons.add,
                        semanticLabel: 'Ajouter un aliment',
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.grey,
                      offset: new Offset(-1.5, 1.5),
                      blurRadius: 5.0,
                    )
                  ],
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height / 3),
                  child: ListView.separated(
                    padding: EdgeInsets.all(10.0),
                    itemCount: widget.currentMeal.foods.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                  child: Text(
                                widget.currentMeal.foods[index].productName,
                                style: TextStyle(fontSize: 18),
                              )),
                              Spacer(),
                              GestureDetector(
                                child: Icon(Icons.delete_forever),
                                onTap: () => this.removeFood(
                                    widget.currentMeal.foods[index]),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 20,
                      );
                    },
                  ),
                ),
              )
            ],
          ),

          /// Lieux du repas
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              "Lieu du repas",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              height: 80,
              child: MealPlaceSelector(
                callbackChangePlace: this.changePlace,
                currentPlace: currentMeal.place,
                activeColor: hexToColor("#E2ECD1"),
              )),

          /// durée du repas
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              "Durée du repas",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              height: 80,
              child: MealDuringTimeSelector(
                callbackChangeDuringTime: this.changeDuringTime,
                currentDuringTime: currentMeal.duringTime,
                activeColor: hexToColor("#E2ECD1"),
              )),

          /// Etat Physique
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              "Etat physique",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              height: 80,
              child: MealPhysicalStateSelector(
                callbackChangePhysicalState: this.changePhysicalState,
                currentPhysicalState: currentMeal.physicalState,
                activeColor: hexToColor("#E2ECD1"),
              )),

          /// Humeurs
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              "Humeur",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              height: 80,
              child: MealMoodSelector(
                callbackChangeMood: this.changeMood,
                currentMood: currentMeal.mood,
                activeColor: hexToColor("#E2ECD1"),
              )),
        ],
      ),
    );
  }
}
