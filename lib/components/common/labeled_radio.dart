import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LabeledRadio extends StatelessWidget {
  const LabeledRadio({
    @required this.label,
    this.padding,
    this.groupValue,
    this.value,
    this.onChanged,
    this.hideCircle,
    this.activeColor,
  });

  final String label;
  final EdgeInsets padding;
  final String groupValue;
  final String value;
  final Function onChanged;
  final bool hideCircle;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value != groupValue) onChanged(value);
      },
      child: Container(
        color: (value != groupValue) ? Colors.white10 : activeColor,
        padding: padding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Visibility(
              visible: !hideCircle,
              child: Radio(
                activeColor: activeColor,
                groupValue: groupValue,
                value: value,
                onChanged: (newValue) {
                  onChanged(newValue);
                },
              ),
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
}
