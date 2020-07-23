import 'package:TEDii/components/icons/tedii_icons_icons.dart';
import 'package:TEDii/components/meals/mood_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MealMoodSelector extends StatefulWidget {
  final void Function(int mood) callbackChangeMood;
  final int currentMood;
  final Color activeColor;

  MealMoodSelector({
    @required this.callbackChangeMood,
    this.currentMood,
    this.activeColor,
  });

  @override
  _MealMoodSelectorState createState() => _MealMoodSelectorState();
}

class _MealMoodSelectorState extends State<MealMoodSelector> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: MoodIcon(
              callbackChangeMood: widget.callbackChangeMood,
              icon: TediiIcons.sentiment_very_dissatisfied,
              mood: 0,
              currentMood: widget.currentMood,
              iconColor: Colors.red,
              backgroundColor: widget.activeColor ?? Colors.green,
            ),
          ),
          Expanded(
            child: MoodIcon(
              callbackChangeMood: widget.callbackChangeMood,
              icon: TediiIcons.sentiment_dissatisfied,
              mood: 1,
              currentMood: widget.currentMood,
              iconColor: Colors.orange,
              backgroundColor: widget.activeColor ?? Colors.green,
            ),
          ),
          Expanded(
            child: MoodIcon(
              callbackChangeMood: widget.callbackChangeMood,
              icon: TediiIcons.sentiment_neutral,
              mood: 2,
              currentMood: widget.currentMood,
              backgroundColor: widget.activeColor ?? Colors.green,
            ),
          ),
          Expanded(
            child: MoodIcon(
              callbackChangeMood: widget.callbackChangeMood,
              icon: TediiIcons.sentiment_satisfied,
              mood: 3,
              currentMood: widget.currentMood,
              iconColor: Colors.lightGreen,
              backgroundColor: widget.activeColor ?? Colors.green,
            ),
          ),
          Expanded(
            child: MoodIcon(
              callbackChangeMood: widget.callbackChangeMood,
              icon: TediiIcons.sentiment_very_satisfied,
              mood: 4,
              currentMood: widget.currentMood,
              iconColor: Colors.green,
              backgroundColor: widget.activeColor ?? Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
