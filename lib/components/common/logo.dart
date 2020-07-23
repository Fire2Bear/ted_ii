import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          "assets/icon/LOGO.png",
          width: 100,
          fit: BoxFit.cover,
        ),
        SizedBox(
          width: 30,
        ),
        /*Icon(
          Icons.calendar_today,
          color: Colors.white,
        ),
        Text(
          " TED'ii",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.left,
        ),*/
      ],
    );
  }
}
