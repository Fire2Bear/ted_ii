import 'dart:convert';

import 'package:uuid/uuid.dart';

/// a standard model
class User {
  String id;
  String firstName;
  String lastName;
  DateTime birthDate;

  User({firstName, lastName, birthDate}) {
    this.id = Uuid().v1();
    this.firstName = firstName;
    this.lastName = lastName;
    this.birthDate = birthDate;
  }

  User.userWithId(this.id, this.firstName, this.lastName, this.birthDate);

  @override
  String toString() {
    if (this.firstName != null &&
        this.lastName != null &&
        this.birthDate != null) {
      return this.firstName +
          " " +
          this.lastName +
          " " +
          (this.birthDate.difference(new DateTime.now()).inDays % 365)
              .toString();
    }
    return "";
  }

  String toJson() {
    return jsonEncode({
      'id': this.id.toString(),
      'firstName': this.firstName.toString(),
      'lastName': this.lastName.toString(),
      'birthDate': this.birthDate.toString(),
    });
  }

  factory User.fromJson(String json) {
    Map<String, dynamic> map = jsonDecode(json);
    return User.userWithId(
        map['id'], map['firstName'], map['lastName'], map['birthDate']);
  }
}
