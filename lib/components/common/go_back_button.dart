import 'package:TEDii/components/icons/tedii_icons_icons.dart';
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
              children: <Widget>[
                Icon(TediiIcons.left), /*Text("Retour")*/
              ],
            )));
  }
}
