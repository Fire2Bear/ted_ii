import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GoBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Row(
              children: <Widget>[Icon(Icons.arrow_back), Text("Retour")],
            )));
  }
}
