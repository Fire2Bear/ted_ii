import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Event {
  String id;
  TimeOfDay time;

  Event({time: TimeOfDay}) {
    this.id = Uuid().v1();
    this.time = time;
  }

  Event.eventWithId(this.id, this.time);

  @override
  String toString() {
    return this.time.toString();
  }

  String toJson() {
    return jsonEncode({
      'id': this.id.toString(),
      'time': this.time.toString(),
    });
  }

  factory Event.fromJson(String json) {
    Map<String, dynamic> map = jsonDecode(json);
    return Event.eventWithId(map['id'] as String, map['time'] as TimeOfDay);
  }

  // A function that converts a json list into a List<Event>.
  static List<Event> listFromJson(String jsonList) {
    final parsed = jsonDecode(jsonList).cast<Map<String, dynamic>>();
    return parsed.map<Event>((json) => Event.fromJson(json)).toList();
  }

  // A function that converts a List<Event> into a json list.
  static String listToJson(List<Event> listEvent) {
    return jsonEncode(
        listEvent.map<String>((event) => event.toJson()).toList());
  }
}
