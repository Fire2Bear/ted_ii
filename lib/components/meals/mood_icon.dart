import 'package:TEDii/utils/utils_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class MoodIcon extends StatelessWidget {
  IconData icon;
  int mood;
  Color iconColor;
  Color backgroundColor;

  int currentMood;
  void Function(int mood) callbackChangeMood;

  MoodIcon(
      {@required this.callbackChangeMood,
      @required this.icon,
      @required this.mood,
      this.iconColor,
      @required this.backgroundColor,
      @required this.currentMood});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: (currentMood == mood)
            ? BoxDecoration(
                color: this.backgroundColor,
//                borderRadius: BorderRadius.circular(100),
                shape: BoxShape.circle)
            : BoxDecoration(),
        child: IconButton(
          onPressed: () {
            this.callbackChangeMood(this.mood);
          },
          highlightColor: this.backgroundColor ?? hexToColor("#E2ECD1"),
          iconSize: 40,
          color: this.iconColor ?? Colors.black,
          icon: Icon(
            this.icon,
          ),
        ));
  }
}
