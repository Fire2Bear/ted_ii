import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GoBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: FlatButton(
            onPressed: () {
              // TODO Go back Navigator.pop()
            },
            child: Row(
              children: <Widget>[Icon(Icons.arrow_back), Text("Retour")],
            )));
  }
}
