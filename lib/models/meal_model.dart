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
    this.foods = [];
  }

  Meal.mealWithId(this.id, this.time, this.mealType, this.foods);

  @override
  String toString() {
    return this.time.toString() + " type de repas :" + this.mealType.toString();
  }

  String toJson() {
    return jsonEncode({
      'id': this.id.toString(),
      'time': this.time.hour.toString() + ":" + this.time.minute.toString(),
      'mealType': this.mealType.toString(),
      'foods': Food.listToJson(this.foods),
    });
  }

  factory Meal.fromJson(String res) {
    Map<String, dynamic> json = jsonDecode(res);
    return Meal.mealWithId(
      json['id'] as String,
      TimeOfDay(
          hour: int.parse(json['time'].split(":")[0]),
          minute: int.parse(json['time'].split(":")[1])),
      int.parse(json['mealType']),
      Food.listFromJson(json['foods'] as String),
    );
  }

  // A function that converts a json list into a List<Meal>.
  static List<Meal> listFromJson(String jsonList) {
    List<dynamic> parsed = jsonDecode(jsonList);
    return parsed.map((json) => Meal.fromJson(json)).toList();
  }

  // A function that converts a List<Meal> into a json list.
  static String listToJson(List<Meal> listMeal) {
    return jsonEncode(listMeal.map<String>((meal) => meal.toJson()).toList());
  }
}
