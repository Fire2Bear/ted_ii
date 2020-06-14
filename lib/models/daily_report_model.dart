import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tedii/utils/utils_service.dart';
import 'package:uuid/uuid.dart';

import 'event_model.dart';
import 'meal_model.dart';
import 'objective_model.dart';

/// a standard model
class DailyReport {
  String id;
  DateTime date;
  List<Meal> meals;
  List<Objective> objectives;
  List<Event> events;

  DailyReport({date: DateTime}) {
    this.id = Uuid().v1();
    this.date = date;
    this.meals = List(4);
    meals[0] = (Meal(time: TimeOfDay.now(), mealType: 0));
    meals[1] = (Meal(time: TimeOfDay.now(), mealType: 1));
    meals[2] = (Meal(time: TimeOfDay.now(), mealType: 2));
    meals[3] = (Meal(time: TimeOfDay.now(), mealType: 3));
    this.objectives = List();
    this.events = List();
  }

  DailyReport.dailyReportWithId(
      this.id, this.date, this.meals, this.objectives, this.events);

  @override
  String toString() {
    return "\n" + "id : " + this.id + ";date : " + this.date.toString();
  }



  String toJson() {
    return jsonEncode({
      'id': this.id.toString(),
      'date': this.date.toString(),
      'meals': Meal.listToJson(this.meals),
      'objectives': Objective.listToJson(this.objectives),
      'events': Event.listToJson(this.events),
    });
  }

  factory DailyReport.fromJson(String json) {
    Map<String, dynamic> map = jsonDecode(json);
    return DailyReport.dailyReportWithId(
        map['id'] as String,
        DateTime.parse(map['date']),
        Meal.listFromJson(map['meals']),
        Objective.listFromJson(map['objectives']),
        Event.listFromJson(map['events']));
  }

  // retourne la date formatée lisible pour l'utilisateur
  String getShortDate() {
//    print("# getShortDate " + this.date.toString());
    String prefix = "";
    if (compareOnlyDateTo(DateTime.now(), this.date) == 0) {
      prefix = "Aujourd'hui, ";
    } else if (compareOnlyDateTo(
            DateTime.now().add(Duration(days: 1)), this.date) ==
        0) {
      prefix = "Demain, ";
    } else if (compareOnlyDateTo(
            DateTime.now().subtract(Duration(days: 1)), this.date) ==
        0) {
      prefix = "Hier, ";
    }

    return prefix + new DateFormat("EEEE d MMMM", 'fr').format(this.date);
  }

  /// retourne le repas du jour demandé en fonction de son type
  /// (0 => petit-dej, 1 => déjeuner, 2 => diner, 3 => encas)
  Meal getMealByMealType(int mealType) {
    return this.meals.singleWhere((meal) {
      return meal.mealType == mealType;
    });
  }

  /// sauvegarde le nouveau repas et remplace l'existant,
  /// il ne peut pas il y avoir 2 repas avec le même mealType
  /// /!\ Après avoir sauvegarder le repas il ne faut pas oublier de sauvegarder le daily_report !!!
  void saveMeal(Meal newMeal) {
    this.meals.map((meal) {
      if (meal.mealType == newMeal.mealType) {
        meal = newMeal;
      }
    });
  }
}
