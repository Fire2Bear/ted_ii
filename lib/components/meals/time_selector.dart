import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TimeSelector extends StatefulWidget {
  TimeOfDay time;

  final void Function(TimeOfDay time) callBack;

  TimeSelector(this.time, this.callBack);

  @override
  _TimeSelectorState createState() => _TimeSelectorState();
}

class _TimeSelectorState extends State<TimeSelector> {
  TimeOfDay time;

  Future<Null> selectTime(BuildContext context) async {
    TimeOfDay dateTime;

    dateTime = await showTimePicker(
      context: context,
      initialTime: time,
      builder: (BuildContext context, Widget child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child,
        );
      },
    );
    if (dateTime != null) {
      this.setState(() {
        time = dateTime;
      });
      // Appel du callback popur mettre à jour le parent
      widget.callBack(this.time);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (this.time == null || this.time != widget.time) {
      setState(() {
        time = widget.time;
      });
    }

    String formatedTime = this.time.hour.toString() + ":";
    if (this.time.minute.toString().length == 1) {
      formatedTime += "0" + this.time.minute.toString();
    } else if (this.time.minute.toString().length == 0) {
      formatedTime += "00";
    } else {
      formatedTime += this.time.minute.toString();
    }

    return Container(
        width: MediaQuery.of(context).size.width,
        child: GestureDetector(
          onTap: () {
            selectTime(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.alarm),
                SizedBox(width: 10),
                Padding(
                  padding: EdgeInsets.all(3),
                  child: Row(
                    children: <Widget>[
                      Text("Heure du repas : ", style: TextStyle(fontSize: 16)),
                      Text(
                        formatedTime,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
