import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'food_model.dart';

class Meal {
  String id;
  int mealType;
  TimeOfDay time;
  List<Food> foods;

  Meal({time: TimeOfDay, mealType: int}) {
    this.id = Uuid().v1();
    this.time = time;
    this.mealType = mealType;
    this.foods = List();
  }

  Meal.mealWithId(this.id, this.time, this.mealType, this.foods);

  @override
  String toString() {
    return this.time.toString() + " type de repas :" + this.mealType.toString();
  }

  String toJson() {
    return jsonEncode({
      'id': this.id.toString(),
      'time': this.time.toString(),
      'mealType': this.mealType.toString(),
      'foods': Food.listToJson(this.foods),
    });
  }

  factory Meal.fromJson(String json) {
    Map<String, dynamic> map = jsonDecode(json);
    return Meal.mealWithId(
      map['id'] as String,
      map['time'] as TimeOfDay,
      map['mealType'] as int,
      Food.listFromJson(map['foods']),
    );
  }

  // A function that converts a json list into a List<Meal>.
  static List<Meal> listFromJson(String jsonList) {
    final parsed = jsonDecode(jsonList).cast<Map<String, dynamic>>();
    return parsed.map<Meal>((json) => Meal.fromJson(json)).toList();
  }

  // A function that converts a List<Meal> into a json list.
  static String listToJson(List<Meal> listMeal) {
    return jsonEncode(listMeal.map<String>((meal) => meal.toJson()).toList());
  }
}
