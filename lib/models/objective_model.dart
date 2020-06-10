import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Objective {
  String id;
  TimeOfDay time;

  Objective({time: TimeOfDay}) {
    this.id = Uuid().v1();
    this.time = time;
  }

  Objective.objectiveWithId(this.id, this.time);

  @override
  String toString() {
    return this.time.toString();
  }

  String toJson() {
    return jsonEncode({
      'id': this.id.toString(),
      'time': this.time,
    });
  }

  factory Objective.fromJson(String json) {
    Map<String, dynamic> map = jsonDecode(json);
    return Objective.objectiveWithId(
        map['id'] as String, map['time'] as TimeOfDay);
  }

  /// A function that converts a json list into a List<Objective>.
  static List<Objective> listFromJson(String jsonList) {
    final parsed = jsonDecode(jsonList).cast<Map<String, dynamic>>();
    return parsed.map<Objective>((json) => Objective.fromJson(json)).toList();
  }

  // A function that converts a List<Objective> into a json list.
  static String listToJson(List<Objective> listObjective) {
    return jsonEncode(
        listObjective.map<String>((objective) => objective.toJson()).toList());
  }
}
